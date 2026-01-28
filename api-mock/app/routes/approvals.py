from fastapi import APIRouter, Header, Path, HTTPException, status
from typing import Optional
from uuid import uuid4
from datetime import datetime

from app.models.schemas import (
    BsApprovalSignRequest, BsSignApprovalResponse,
    BsSignApprovalResponseData, BsGetApprovalStatusResponse,
    BsGetApprovalStatusResponseData, BsApprovalSummary,
    BsOperationStatus, BsApprovalStatus, BsApprovalAction,
    ApiError, ApiErrorItem
)
from app.services.database_service import DatabaseService
from app.utils.mock_generator import MockDataGenerator

router = APIRouter(prefix="/approvals", tags=["Approvals"])
db_service = DatabaseService()
mock_gen = MockDataGenerator()


@router.get(
    "/{operationId}/status",
    response_model=BsGetApprovalStatusResponse,
    responses={
        401: {"model": ApiError},
        404: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def get_approval_status(
    operation_id: str = Path(..., alias="operationId"),
    x_correlation_id: Optional[str] = Header(None, alias="X-Correlation-Id"),
    x_creation_user_id: Optional[str] = Header(None, alias="X-Creation-User-Id")
):
    """
    Consulta el estado actual de todas las firmas requeridas para una
    operación específica. Muestra qué aprobadores ya firmaron y quiénes
    están pendientes.
    """
    try:
        # Buscar operación SOLO en la base de datos (db_mock.json)
        operation = db_service.get_operation_by_id(operation_id)

        # Si no existe, retornar error 404
        if not operation:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "success": False,
                    "message": "Operación no encontrada",
                    "errors": [
                        ApiErrorItem(
                            code="NOT_FOUND",
                            message="No se encontró la operación con ID especificado"
                        ).model_dump()
                    ]
                }
            )

        # Obtener resumen de aprobaciones desde la operación
        approvals = []
        if operation.approvals:
            for approval in operation.approvals:
                approvals.append(
                    BsApprovalSummary(
                        approvalId=approval.approvalId,
                        approvalLevel=approval.approvalLevel,
                        status=approval.status,
                        signedAt=approval.signedAt
                    )
                )

        response_data = BsGetApprovalStatusResponseData(
            operationId=operation.operationId,
            operationName=operation.operationName,
            status=operation.status,
            amount=operation.amount,
            beneficiaryName=operation.beneficiaryName,
            approvalLevelsRequired=operation.approvalLevelsRequired,
            currentApprovalLevel=operation.currentApprovalLevel,
            expiresAt=operation.expiresAt,
            approvals=approvals
        )

        return BsGetApprovalStatusResponse(
            success=True,
            message="Estado obtenido exitosamente",
            data=response_data
        )

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )


@router.post(
    "/{operationId}/approve",
    response_model=BsSignApprovalResponse,
    responses={
        400: {"model": ApiError},
        401: {"model": ApiError},
        403: {"model": ApiError},
        404: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def sign_approval_operation(
    request: BsApprovalSignRequest,
    operation_id: str = Path(..., alias="operationId"),
    x_correlation_id: Optional[str] = Header(None, alias="X-Correlation-Id"),
    x_creation_user_id: Optional[str] = Header(None, alias="X-Creation-User-Id")
):
    """
    Permite a un aprobador firmar una operación.
    Puede aprobar o rechazar la operación.
    """
    try:
        # Buscar operación en la base de datos
        operation = db_service.get_operation_by_id(operation_id)

        # Si no existe, generar error
        if not operation:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "success": False,
                    "message": "Operación no encontrada",
                    "errors": [
                        ApiErrorItem(
                            code="NOT_FOUND",
                            message="No se encontró la operación con ID especificado"
                        ).model_dump()
                    ]
                }
            )

        # Verificar que la operación está pendiente
        if operation.status not in [BsOperationStatus.PENDING, BsOperationStatus.PROCESSING]:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "success": False,
                    "message": "La operación no puede ser firmada en su estado actual",
                    "errors": [
                        ApiErrorItem(
                            code="INVALID_OPERATION_STATUS",
                            message=f"No se puede firmar una operación con estado {operation.status.value}"
                        ).model_dump()
                    ]
                }
            )

        # Buscar la aprobación correspondiente al usuario
        approval = None
        if operation.approvals:
            for appr in operation.approvals:
                if str(appr.approverUserId) == str(request.approverUserId):
                    approval = appr
                    break

        if not approval:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail={
                    "success": False,
                    "message": "Usuario no autorizado para aprobar esta operación",
                    "errors": [
                        ApiErrorItem(
                            code="NOT_AUTHORIZED_APPROVER",
                            message="El usuario no está en la lista de aprobadores"
                        ).model_dump()
                    ]
                }
            )

        # Procesar la firma
        signed_at = datetime.now()
        rejected_at = None
        new_approval_status = BsApprovalStatus.APPROVED if request.action == BsApprovalAction.APPROVE else BsApprovalStatus.REJECTED

        # Actualizar la aprobación
        db_service.update_approval(
            str(approval.approvalId),
            new_approval_status,
            signedAt=signed_at,
            action=request.action
        )

        # Actualizar estado de la operación
        new_operation_status = operation.status
        current_level = operation.currentApprovalLevel

        if request.action == BsApprovalAction.APPROVE:
            current_level += 1
            if current_level >= operation.approvalLevelsRequired:
                new_operation_status = BsOperationStatus.APPROVED
                approved_at = signed_at
            else:
                new_operation_status = BsOperationStatus.PROCESSING
                approved_at = None
        else:
            new_operation_status = BsOperationStatus.REJECTED
            rejected_at = signed_at
            approved_at = None

        # Actualizar operación
        db_service.update_operation_status(
            operation_id,
            new_operation_status,
            currentApprovalLevel=current_level,
            approvedAt=approved_at,
            rejectedAt=rejected_at
        )

        # Preparar respuesta
        response_data = BsSignApprovalResponseData(
            correlationId=x_correlation_id,
            approvalId=approval.approvalId,
            operationId=operation.operationId,
            operationType=operation.transferType,
            action=new_approval_status,
            operationStatus=new_operation_status,
            approvalLevel=approval.approvalLevel,
            approvalName=approval.approvalName,
            approvalMail="mock@example.com",
            signedAt=signed_at,
            rejectedAt=rejected_at,
            approvalLevelsRequired=operation.approvalLevelsRequired,
            approvedAt=approved_at if new_operation_status == BsOperationStatus.APPROVED else None
        )

        return BsSignApprovalResponse(
            success=True,
            message="Firma registrada exitosamente",
            data=response_data
        )

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )
