from datetime import datetime
from typing import List, Optional
from uuid import UUID
from pydantic import BaseModel, Field, EmailStr, field_validator
from enum import Enum


# ==================== ENUMS ====================

class BsOperationStatus(str, Enum):
    PENDING = "PENDING"
    APPROVED = "APPROVED"
    REJECTED = "REJECTED"
    PROCESSING = "PROCESSING"
    COMPLETED = "COMPLETED"
    FAILED = "FAILED"
    CANCELLED = "CANCELLED"


class BsApprovalStatus(str, Enum):
    APPROVED = "APPROVED"
    REJECTED = "REJECTED"
    EXPIRED = "EXPIRED"
    CANCELLED = "CANCELLED"


class BsApprovalAction(str, Enum):
    APPROVE = "APPROVE"
    REJECT = "REJECT"


class BsOperationTarget(str, Enum):
    TRANSFER = "TRANSFER"
    PAYROLL = "PAYROLL"


class BsCurrencyType(str, Enum):
    PEN = "PEN"
    USD = "USD"


class BsOperationType(str, Enum):
    PAYROLL_PAYMENT = "PAYROLL_PAYMENT"
    CTS_PAYMENT = "CTS_PAYMENT"
    INTERBANK_TRANSFER = "INTERBANK_TRANSFER"
    OWN_TRANSFER = "OWN_TRANSFER"


class BsTransferType(str, Enum):
    PAYROLL_PAYMENT = "PAYROLL_PAYMENT"
    CTS_PAYMENT = "CTS_PAYMENT"
    INTERBANK_TRANSFER = "INTERBANK_TRANSFER"
    OWN_TRANSFER = "OWN_TRANSFER"


class BsAccountType(str, Enum):
    SAVINGS = "SAVINGS"
    CURRENT = "CURRENT"
    CTS = "CTS"
    SALARY = "SALARY"


# ==================== BASE MODELS ====================

class ApiResponse(BaseModel):
    success: bool = Field(..., description="Indica si la operación fue exitosa")
    message: str = Field(..., description="Mensaje descriptivo del resultado")
    data: Optional[dict] = Field(None, description="Datos de respuesta (opcional)")


class ApiErrorItem(BaseModel):
    code: str = Field(..., example="VALIDATION_ERROR")
    message: str = Field(..., example="El campo es requerido")
    field: Optional[str] = Field(None, example="companyId")


class ApiError(BaseModel):
    success: bool = Field(False, example=False)
    message: str = Field(..., example="El campo es requerido")
    errors: Optional[List[ApiErrorItem]] = None


class PaginationInfo(BaseModel):
    page: int = Field(..., ge=1)
    limit: int = Field(..., ge=10, le=100)
    total: int = Field(..., ge=0)
    pages: int = Field(..., ge=0)
    hasNext: Optional[bool] = None
    hasPrevious: Optional[bool] = None


# ==================== REQUEST MODELS ====================

class ApprovalUser(BaseModel):
    id: UUID
    email: EmailStr
    name: str


class BsCreateOperationRequest(BaseModel):
    companyRuc: str = Field(..., description="RUC de la compañía")
    operationDate: datetime
    operationType: BsOperationType
    amount: float = Field(..., ge=0, multiple_of=0.01)
    currency: BsCurrencyType
    approvalLevelsRequired: int = Field(..., ge=0)
    users: Optional[List[ApprovalUser]] = None


class BsApprovalSignRequest(BaseModel):
    action: BsApprovalAction
    approverUserId: UUID
    operationTarget: Optional[BsOperationTarget] = None


class BsCancelOperationRequest(BaseModel):
    cancellationReason: str = Field(..., min_length=10, max_length=500)


# ==================== DOMAIN MODELS ====================

class BsAccountSummary(BaseModel):
    accountNumber: str = Field(..., example="123-456789-0-01")


class BsDestinationAccountSummary(BaseModel):
    accountNumber: Optional[str] = Field(None, example="00211234567890123456")
    beneficiaryName: Optional[str] = Field(None, example="EMPRESA DEMO SAC")


class BsApprovalSummary(BaseModel):
    approvalId: UUID
    approvalLevel: int
    status: BsApprovalStatus
    signedAt: Optional[datetime] = None


class BsApproval(BaseModel):
    approvalId: UUID
    operationId: UUID
    approverUserId: UUID
    approvalName: str = Field(..., max_length=255)
    approvalLevel: int = Field(..., ge=1, le=3)
    status: BsApprovalStatus
    action: Optional[BsApprovalAction] = None
    rejectionReason: Optional[str] = Field(None, max_length=500)
    passwordVerified: Optional[bool] = None
    otpVerified: Optional[bool] = None
    signedAt: Optional[datetime] = None
    expiresAt: Optional[datetime] = None


class BsOperationSummary(BaseModel):
    operationId: UUID
    operationName: str
    operationDate: datetime
    operationType: BsOperationType
    status: BsOperationStatus
    currency: Optional[BsCurrencyType] = None
    amount: Optional[float] = None
    commision: Optional[float] = None
    sourceAccount: Optional[BsAccountSummary] = None
    destinationAccount: Optional[BsDestinationAccountSummary] = None
    approvalLevelsRequired: int
    currentApprovalLevel: int
    createdAt: datetime


class BsOperation(BaseModel):
    operationId: UUID
    operationName: str = Field(..., max_length=255)
    operationDate: datetime
    status: BsOperationStatus
    sourceAccountNumber: str = Field(..., pattern=r"^[0-9]{3}-[0-9]{6}-[0-9]-[0-9]{2}$")
    sourceAccountType: BsAccountType
    beneficiaryName: Optional[str] = Field(None, max_length=255)
    transferType: BsTransferType
    amount: Optional[float] = Field(None, ge=0)
    currency: Optional[BsCurrencyType] = None
    destinationAccountNumber: Optional[str] = Field(None, max_length=21)
    approvalLevelsRequired: int = Field(..., ge=1, le=3)
    currentApprovalLevel: int = Field(..., ge=0)
    expiresAt: Optional[datetime] = None
    approvedAt: Optional[datetime] = None
    rejectedAt: Optional[datetime] = None
    approvals: Optional[List[BsApproval]] = None

# Nuevo modelo para validación facial 
class RequestFacialValidation(BaseModel):
    FaceScan: str
    AuditTrailImage: str
    LowQualityAuditTrailImage: str
    XUserAgent: str



# ==================== RESPONSE MODELS ====================

class BsCreateOperationResponseData(BaseModel):
    operationId: UUID
    operationName: str
    status: BsOperationStatus
    approvalLevelsRequired: int = Field(..., example=2)


class BsCreateOperationResponse(BaseModel):
    success: bool = True
    message: str
    data: BsCreateOperationResponseData


class BsListOperationsResponseData(BaseModel):
    operations: List[BsOperationSummary]
    pagination: PaginationInfo


class BsListOperationsResponse(BaseModel):
    success: bool = True
    message: str
    data: BsListOperationsResponseData


class BsGetOperationDetailResponse(BaseModel):
    success: bool = True
    message: str
    data: BsOperation


class BsCancelOperationResponseData(BaseModel):
    operationId: UUID
    status: BsOperationStatus
    cancelledAt: datetime
    cancelledBy: str
    cancellationReason: str


class BsCancelOperationResponse(BaseModel):
    success: bool = True
    message: str
    data: BsCancelOperationResponseData


class BsGetApprovalStatusResponseData(BaseModel):
    operationId: UUID
    operationName: str
    status: BsOperationStatus
    amount: Optional[float] = None
    beneficiaryName: Optional[str] = None
    approvalLevelsRequired: int
    currentApprovalLevel: int
    expiresAt: Optional[datetime] = None
    approvals: List[BsApprovalSummary]


class BsGetApprovalStatusResponse(BaseModel):
    success: bool = True
    message: str
    data: BsGetApprovalStatusResponseData


class BsSignApprovalResponseData(BaseModel):
    correlationId: Optional[UUID] = None
    approvalId: UUID
    operationId: UUID
    operationType: Optional[BsOperationType] = None
    action: BsApprovalStatus
    operationStatus: BsOperationStatus
    approvalLevel: int
    approvalName: str
    approvalMail: Optional[str] = None
    signedAt: datetime
    rejectedAt: Optional[datetime] = None
    approvalLevelsRequired: Optional[int] = None
    approvedAt: Optional[datetime] = None


class BsSignApprovalResponse(BaseModel):
    success: bool = True
    message: str
    data: BsSignApprovalResponseData


class BsSignApprovalListResponse(BaseModel):
    success: bool = True
    message: str
    data: List[BsSignApprovalResponseData]
