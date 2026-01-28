import random
from datetime import datetime, timedelta
from uuid import uuid4
from typing import List
from app.models.schemas import (
    BsOperation, BsOperationSummary, BsApproval, BsApprovalSummary,
    BsOperationStatus, BsApprovalStatus, BsOperationType, BsCurrencyType,
    BsAccountType, BsTransferType, BsAccountSummary, BsDestinationAccountSummary
)


class MockDataGenerator:
    """Generador de datos mock basado en los schemas de OpenAPI"""

    COMPANY_NAMES = [
        "EMPRESA DEMO SAC", "CORPORACION ABC SAC", "SERVICIOS XYZ EIRL",
        "COMERCIAL PERU SA", "INDUSTRIAS MODELO SAC"
    ]

    USER_NAMES = [
        "Juan Pérez García", "María López Torres", "Carlos Rodríguez Sánchez",
        "Ana María Flores Díaz", "Roberto Castro Vega"
    ]

    @staticmethod
    def generate_ruc() -> str:
        """Genera un RUC peruano válido (11 dígitos)"""
        return f"20{random.randint(100000000, 999999999)}"

    @staticmethod
    def generate_account_number() -> str:
        """Genera un número de cuenta bancaria con formato XXX-XXXXXX-X-XX"""
        return f"{random.randint(100, 999)}-{random.randint(100000, 999999)}-{random.randint(0, 9)}-{random.randint(10, 99)}"

    @staticmethod
    def generate_cci() -> str:
        """Genera un CCI (Código de Cuenta Interbancario) de 20 dígitos"""
        return f"{random.randint(10**19, 10**20-1)}"

    @staticmethod
    def generate_amount() -> float:
        """Genera un monto aleatorio entre 100 y 50000"""
        return round(random.uniform(100.0, 50000.0), 2)

    @staticmethod
    def generate_commission() -> float:
        """Genera una comisión aleatoria entre 0 y 50"""
        return round(random.uniform(0.0, 50.0), 2)

    @staticmethod
    def random_datetime(days_ago: int = 7) -> datetime:
        """Genera una fecha aleatoria en los últimos N días"""
        now = datetime.now()
        delta = timedelta(days=random.randint(0, days_ago))
        return now - delta

    @staticmethod
    def future_datetime(days_ahead: int = 7) -> datetime:
        """Genera una fecha futura en los próximos N días"""
        now = datetime.now()
        delta = timedelta(days=random.randint(1, days_ahead))
        return now + delta

    @classmethod
    def generate_approval(
        cls,
        operation_id: str,
        level: int = 1,
        status: BsApprovalStatus = BsApprovalStatus.APPROVED
    ) -> BsApproval:
        """Genera una aprobación mock"""
        approval_id = str(uuid4())
        approver_id = str(uuid4())

        return BsApproval(
            approvalId=approval_id,
            operationId=operation_id,
            approverUserId=approver_id,
            approvalName=random.choice(cls.USER_NAMES),
            approvalLevel=level,
            status=status,
            action=None,
            rejectionReason=None,
            passwordVerified=True,
            otpVerified=True,
            signedAt=cls.random_datetime(3) if status == BsApprovalStatus.APPROVED else None,
            expiresAt=cls.future_datetime(7)
        )

    @classmethod
    def generate_approval_summary(
        cls,
        level: int = 1,
        status: BsApprovalStatus = BsApprovalStatus.APPROVED
    ) -> BsApprovalSummary:
        """Genera un resumen de aprobación mock"""
        return BsApprovalSummary(
            approvalId=str(uuid4()),
            approvalLevel=level,
            status=status,
            signedAt=cls.random_datetime(3) if status == BsApprovalStatus.APPROVED else None
        )

    @classmethod
    def generate_operation(
        cls,
        operation_id: str = None,
        status: BsOperationStatus = BsOperationStatus.PENDING,
        include_approvals: bool = True
    ) -> BsOperation:
        """Genera una operación completa mock"""
        if operation_id is None:
            operation_id = str(uuid4())

        operation_type = random.choice(list(BsTransferType))
        approval_levels = random.randint(1, 3)
        current_level = random.randint(0, approval_levels) if status != BsOperationStatus.PENDING else 0

        approvals = None
        if include_approvals:
            approvals = [
                cls.generate_approval(operation_id, level=i+1)
                for i in range(approval_levels)
            ]

        return BsOperation(
            operationId=operation_id,
            operationName=f"Operación {operation_type.value}",
            operationDate=cls.random_datetime(30),
            status=status,
            sourceAccountNumber=cls.generate_account_number(),
            sourceAccountType=random.choice(list(BsAccountType)),
            beneficiaryName=random.choice(cls.COMPANY_NAMES),
            transferType=operation_type,
            amount=cls.generate_amount(),
            currency=random.choice(list(BsCurrencyType)),
            destinationAccountNumber=cls.generate_cci(),
            approvalLevelsRequired=approval_levels,
            currentApprovalLevel=current_level,
            expiresAt=cls.future_datetime(7),
            approvedAt=cls.random_datetime(1) if status == BsOperationStatus.APPROVED else None,
            rejectedAt=cls.random_datetime(1) if status == BsOperationStatus.REJECTED else None,
            approvals=approvals
        )

    @classmethod
    def generate_operation_summary(
        cls,
        operation_id: str = None,
        status: BsOperationStatus = BsOperationStatus.PENDING
    ) -> BsOperationSummary:
        """Genera un resumen de operación mock"""
        if operation_id is None:
            operation_id = str(uuid4())

        operation_type = random.choice(list(BsOperationType))
        approval_levels = random.randint(1, 3)
        current_level = random.randint(0, approval_levels) if status != BsOperationStatus.PENDING else 0

        return BsOperationSummary(
            operationId=operation_id,
            operationName=f"Operación {operation_type.value}",
            operationDate=cls.random_datetime(30),
            operationType=operation_type,
            status=status,
            currency=random.choice(list(BsCurrencyType)),
            amount=cls.generate_amount(),
            commision=cls.generate_commission(),
            sourceAccount=BsAccountSummary(accountNumber=cls.generate_account_number()),
            destinationAccount=BsDestinationAccountSummary(
                accountNumber=cls.generate_cci(),
                beneficiaryName=random.choice(cls.COMPANY_NAMES)
            ),
            approvalLevelsRequired=approval_levels,
            currentApprovalLevel=current_level,
            createdAt=cls.random_datetime(30)
        )

    @classmethod
    def generate_operations_list(cls, count: int = 10) -> List[BsOperationSummary]:
        """Genera una lista de operaciones mock"""
        statuses = list(BsOperationStatus)
        return [
            cls.generate_operation_summary(status=random.choice(statuses))
            for _ in range(count)
        ]
