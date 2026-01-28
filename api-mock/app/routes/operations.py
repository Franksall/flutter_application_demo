from fastapi import APIRouter, Header, Query, Path, HTTPException, status
from typing import Optional
from uuid import uuid4
from datetime import datetime

from app.models.schemas import (
    BsCreateOperationRequest, BsCreateOperationResponse,
    BsCreateOperationResponseData, BsListOperationsResponse,
    BsListOperationsResponseData, BsGetOperationDetailResponse,
    BsCancelOperationRequest, BsCancelOperationResponse,
    BsCancelOperationResponseData, BsSignApprovalListResponse,
    BsSignApprovalResponseData, BsOperationStatus, PaginationInfo,
    ApiError, ApiErrorItem
)
from app.services.database_service import DatabaseService
from app.utils.mock_generator import MockDataGenerator

router = APIRouter(prefix="/approvals", tags=["Operations"])
db_service = DatabaseService()
mock_gen = MockDataGenerator()


@router.post(
    "/operations",
    response_model=BsCreateOperationResponse,
    status_code=status.HTTP_201_CREATED,
    responses={
        400: {"model": ApiError},
        401: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def create_approval_operation(
    request: BsCreateOperationRequest,
    x_correlation_id: Optional[str] = Header(None, alias="X-Correlation-Id"),
    x_creation_user_id: Optional[str] = Header(None, alias="X-Creation-User-Id")
):
    """
    Crea una nueva operación que requiere aprobación dual.

    Este endpoint es invocado automáticamente por otros módulos cuando
    se requiere aprobación para operaciones como transferencias o pagos masivos.
    """
    try:
        # Generar ID de operación
        operation_id = str(uuid4())

        # Crear operación mock usando los datos del request
        operation = mock_gen.generate_operation(
            operation_id=operation_id,
            status=BsOperationStatus.PENDING,
            include_approvals=True
        )

        # Guardar en la base de datos
        db_service.create_operation(operation)

        # Preparar respuesta
        response_data = BsCreateOperationResponseData(
            operationId=operation.operationId,
            operationName=operation.operationName,
            status=operation.status,
            approvalLevelsRequired=request.approvalLevelsRequired
        )

        return BsCreateOperationResponse(
            success=True,
            message="Operación creada exitosamente",
            data=response_data
        )

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )


@router.get(
    "/operations",
    response_model=BsListOperationsResponse,
    responses={
        401: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def list_operations(
    x_creation_user_id: Optional[str] = Header(None, alias="X-Creation-User-Id"),
    x_company_ruc: Optional[str] = Header(None, alias="X-Company-RUC"),
    status_filter: Optional[BsOperationStatus] = Query(None, alias="status"),
    page: int = Query(1, ge=1),
    limit: int = Query(20, ge=10, le=100)
):
    """
    Obtiene el listado de operaciones pendientes o aprobadas de un usuario en concreto.
    """
    try:
        # Obtener operaciones SOLO de la base de datos (db_mock.json)
        operations_data, total = db_service.list_operations(
            status=status_filter,
            page=page,
            limit=limit
        )

        # Convertir de dict a objetos Pydantic
        from app.models.schemas import BsOperationSummary
        operations_data = [BsOperationSummary(**op) for op in operations_data]

        # Calcular información de paginación
        total_pages = (total + limit - 1) // limit if total > 0 else 0
        pagination = PaginationInfo(
            page=page,
            limit=limit,
            total=total,
            pages=total_pages,
            hasNext=page < total_pages,
            hasPrevious=page > 1
        )

        response_data = BsListOperationsResponseData(
            operations=operations_data,
            pagination=pagination
        )

        return BsListOperationsResponse(
            success=True,
            message="Listado obtenido exitosamente",
            data=response_data
        )

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )


@router.get(
    "/{operationId}",
    response_model=BsGetOperationDetailResponse,
    responses={
        401: {"model": ApiError},
        404: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def get_operation_detail(
    operation_id: str = Path(..., alias="operationId"),
    x_correlation_id: Optional[str] = Header(None, alias="X-Correlation-Id")
):
    """
    Obtiene el detalle completo de una operación de aprobación incluyendo
    metadata adicional y el historial de firmas.
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

        return BsGetOperationDetailResponse(
            success=True,
            message="Detalle obtenido exitosamente",
            data=operation
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )


@router.delete(
    "/{operationId}",
    response_model=BsCancelOperationResponse,
    responses={
        400: {"model": ApiError},
        401: {"model": ApiError},
        403: {"model": ApiError},
        404: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def cancel_operation(
    request: BsCancelOperationRequest,
    operation_id: str = Path(..., alias="operationId"),
    x_correlation_id: Optional[str] = Header(None, alias="X-Correlation-Id")
):
    """
    Cancela una operación pendiente de aprobación.

    Solo puede ser ejecutado por el usuario que creó la operación
    o por usuarios con permisos administrativos.
    """
    try:
        # Buscar operación
        operation = db_service.get_operation_by_id(operation_id)

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

        # Verificar si la operación puede ser cancelada
        if operation.status not in [BsOperationStatus.PENDING, BsOperationStatus.PROCESSING]:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "success": False,
                    "message": "La operación no puede ser cancelada en su estado actual",
                    "errors": [
                        ApiErrorItem(
                            code="OPERATION_CANNOT_BE_CANCELLED",
                            message=f"No se puede cancelar una operación con estado {operation.status.value}"
                        ).model_dump()
                    ]
                }
            )

        # Actualizar estado de la operación
        cancelled_at = datetime.now()
        updated_operation = db_service.update_operation_status(
            operation_id,
            BsOperationStatus.CANCELLED,
            cancelledAt=cancelled_at
        )

        response_data = BsCancelOperationResponseData(
            operationId=operation_id,
            status=BsOperationStatus.CANCELLED,
            cancelledAt=cancelled_at,
            cancelledBy="Usuario Mock",
            cancellationReason=request.cancellationReason
        )

        return BsCancelOperationResponse(
            success=True,
            message="Operación cancelada exitosamente",
            data=response_data
        )

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )


@router.get(
    "/get/{correlationId}",
    response_model=BsSignApprovalListResponse,
    responses={
        401: {"model": ApiError},
        404: {"model": ApiError},
        500: {"model": ApiError}
    }
)
async def get_approval_operation_detail(
    correlation_id: str = Path(..., alias="correlationId")
):
    """
    Obtiene el detalle de los aprobadores de una operación.
    """
    try:
        # Buscar operaciones por correlation ID SOLO en la base de datos
        approvals_data = db_service.get_operation_by_correlation_id(correlation_id)

        # Convertir a objetos Pydantic
        response_data = [BsSignApprovalResponseData(**data) for data in approvals_data] if approvals_data else []

        return BsSignApprovalListResponse(
            success=True,
            message="Detalle obtenido exitosamente",
            data=response_data
        )

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={"success": False, "message": f"Error interno del servidor: {str(e)}"}
        )
