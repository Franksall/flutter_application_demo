import json
import os
from typing import List, Optional, Dict, Any
from datetime import datetime
from uuid import UUID
from app.models.schemas import (
    BsOperation, BsOperationSummary, BsApproval,
    BsOperationStatus, BsApprovalStatus, BsAccountType, BsTransferType
)


class DatabaseService:
    """Servicio para gestionar la persistencia mock en JSON"""

    def __init__(self, db_path: str = "app/data/db_mock.json"):
        self.db_path = db_path
        self._ensure_db_exists()

    def _ensure_db_exists(self):
        """Asegura que el archivo de base de datos existe"""
        if not os.path.exists(self.db_path):
            os.makedirs(os.path.dirname(self.db_path), exist_ok=True)
            self._write_db({"operations": [], "approvals": []})

    def _read_db(self) -> Dict[str, Any]:
        """Lee la base de datos desde el archivo JSON"""
        try:
            with open(self.db_path, 'r', encoding='utf-8') as f:
                return json.load(f)
        except (FileNotFoundError, json.JSONDecodeError):
            return {"operations": [], "approvals": []}

    def _write_db(self, data: Dict[str, Any]):
        """Escribe la base de datos al archivo JSON"""
        with open(self.db_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False, default=str)

    def _convert_to_operation(self, op_dict: Dict[str, Any], approvals: List[BsApproval] = None) -> BsOperation:
        """
        Convierte un dict del JSON (formato BsOperationSummary) al modelo BsOperation.
        Maneja ambos formatos: el nuevo (BsOperationSummary) y el antiguo (BsOperation).
        """
        # Extraer sourceAccountNumber desde sourceAccount si existe
        source_account_number = op_dict.get("sourceAccountNumber")
        if not source_account_number and op_dict.get("sourceAccount"):
            source_account_number = op_dict["sourceAccount"].get("accountNumber", "000-000000-0-00")

        # Extraer destinationAccountNumber desde destinationAccount si existe
        dest_account_number = op_dict.get("destinationAccountNumber")
        if not dest_account_number and op_dict.get("destinationAccount"):
            dest_account_number = op_dict["destinationAccount"].get("accountNumber")

        # Extraer beneficiaryName desde destinationAccount si existe
        beneficiary_name = op_dict.get("beneficiaryName")
        if not beneficiary_name and op_dict.get("destinationAccount"):
            beneficiary_name = op_dict["destinationAccount"].get("beneficiaryName")

        # Mapear operationType a transferType si es necesario
        transfer_type = op_dict.get("transferType")
        if not transfer_type and op_dict.get("operationType"):
            transfer_type = op_dict["operationType"]

        # Crear el objeto BsOperation
        return BsOperation(
            operationId=op_dict.get("operationId"),
            operationName=op_dict.get("operationName", "Operación"),
            operationDate=op_dict.get("operationDate"),
            status=op_dict.get("status"),
            sourceAccountNumber=source_account_number,
            sourceAccountType=op_dict.get("sourceAccountType", BsAccountType.CURRENT),
            beneficiaryName=beneficiary_name,
            transferType=transfer_type,
            amount=op_dict.get("amount"),
            currency=op_dict.get("currency"),
            destinationAccountNumber=dest_account_number,
            approvalLevelsRequired=op_dict.get("approvalLevelsRequired", 1),
            currentApprovalLevel=op_dict.get("currentApprovalLevel", 0),
            expiresAt=op_dict.get("expiresAt"),
            approvedAt=op_dict.get("approvedAt"),
            rejectedAt=op_dict.get("rejectedAt"),
            approvals=approvals
        )

    # ==================== OPERATIONS ====================

    def create_operation(self, operation: BsOperation) -> BsOperation:
        """Crea una nueva operación en la base de datos"""
        db = self._read_db()

        # Convertir el objeto a dict para almacenamiento
        operation_dict = operation.model_dump(mode='json')
        db["operations"].append(operation_dict)

        # Guardar aprobaciones asociadas
        if operation.approvals:
            for approval in operation.approvals:
                approval_dict = approval.model_dump(mode='json')
                db["approvals"].append(approval_dict)

        self._write_db(db)
        return operation

    def get_operation_by_id(self, operation_id: str) -> Optional[BsOperation]:
        """Obtiene una operación por su ID"""
        db = self._read_db()

        for op_dict in db["operations"]:
            if op_dict.get("operationId") == operation_id:
                # Cargar aprobaciones asociadas
                approvals = [
                    BsApproval(**appr)
                    for appr in db["approvals"]
                    if appr.get("operationId") == operation_id
                ]
                # Usar el método de conversión para manejar ambos formatos de datos
                return self._convert_to_operation(op_dict, approvals)

        return None

    def get_operation_by_correlation_id(self, correlation_id: str) -> Optional[List[Dict[str, Any]]]:
        """Obtiene operaciones por correlation ID (simulado)"""
        db = self._read_db()

        # En un escenario real, buscaríamos por correlation_id
        # Para el mock, retornamos algunas aprobaciones aleatorias
        if db["approvals"]:
            # Retornar las primeras 2 aprobaciones como ejemplo
            return db["approvals"][:2] if len(db["approvals"]) >= 2 else db["approvals"]

        return []

    def list_operations(
        self,
        status: Optional[BsOperationStatus] = None,
        page: int = 1,
        limit: int = 20
    ) -> tuple[List[Dict[str, Any]], int]:
        """Lista operaciones con filtros y paginación"""
        db = self._read_db()
        operations = db["operations"]

        # Filtrar por status si se proporciona
        if status:
            operations = [op for op in operations if op.get("status") == status.value]

        # Calcular paginación
        total = len(operations)
        start = (page - 1) * limit
        end = start + limit

        paginated_operations = operations[start:end]

        return paginated_operations, total

    def update_operation_status(
        self,
        operation_id: str,
        new_status: BsOperationStatus,
        **kwargs
    ) -> Optional[BsOperation]:
        """Actualiza el estado de una operación"""
        db = self._read_db()

        for i, op in enumerate(db["operations"]):
            if op.get("operationId") == operation_id:
                op["status"] = new_status.value

                # Actualizar campos adicionales
                for key, value in kwargs.items():
                    if value is not None:
                        op[key] = value if not isinstance(value, datetime) else value.isoformat()

                db["operations"][i] = op
                self._write_db(db)

                return self.get_operation_by_id(operation_id)

        return None

    def delete_operation(self, operation_id: str) -> bool:
        """Elimina una operación (marca como cancelada)"""
        return self.update_operation_status(
            operation_id,
            BsOperationStatus.CANCELLED,
            cancelledAt=datetime.now()
        ) is not None

    # ==================== APPROVALS ====================

    def create_approval(self, approval: BsApproval) -> BsApproval:
        """Crea una nueva aprobación"""
        db = self._read_db()
        approval_dict = approval.model_dump(mode='json')
        db["approvals"].append(approval_dict)
        self._write_db(db)
        return approval

    def get_approvals_by_operation(self, operation_id: str) -> List[BsApproval]:
        """Obtiene todas las aprobaciones de una operación"""
        db = self._read_db()
        approvals = [
            BsApproval(**appr)
            for appr in db["approvals"]
            if appr.get("operationId") == operation_id
        ]
        return approvals

    def update_approval(
        self,
        approval_id: str,
        status: BsApprovalStatus,
        **kwargs
    ) -> Optional[BsApproval]:
        """Actualiza una aprobación"""
        db = self._read_db()

        for i, appr in enumerate(db["approvals"]):
            if appr.get("approvalId") == approval_id:
                appr["status"] = status.value

                # Actualizar campos adicionales
                for key, value in kwargs.items():
                    if value is not None:
                        appr[key] = value if not isinstance(value, datetime) else value.isoformat()

                db["approvals"][i] = appr
                self._write_db(db)

                return BsApproval(**appr)

        return None

    # ==================== UTILITIES ====================

    def reset_database(self):
        """Reinicia la base de datos (útil para testing)"""
        self._write_db({"operations": [], "approvals": []})

    def get_stats(self) -> Dict[str, int]:
        """Obtiene estadísticas de la base de datos"""
        db = self._read_db()
        return {
            "total_operations": len(db["operations"]),
            "total_approvals": len(db["approvals"])
        }
