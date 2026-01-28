import 'package:equatable/equatable.dart';

/// Representa la información de una firma de aprobación
class ApprovalEntity extends Equatable {
  final String approvalId;
  final String operationId;
  final String approverUserId;
  final String approvalName;
  final int approvalLevel;
  final String status;
  final String? action;
  final String? rejectionReason;
  final bool? passwordVerified;
  final bool? otpVerified;
  final String? signedAt;
  final String? expiresAt;

  const ApprovalEntity({
    required this.approvalId,
    required this.operationId,
    required this.approverUserId,
    required this.approvalName,
    required this.approvalLevel,
    required this.status,
    this.action,
    this.rejectionReason,
    this.passwordVerified,
    this.otpVerified,
    this.signedAt,
    this.expiresAt,
  });

  @override
  List<Object?> get props => [
        approvalId,
        operationId,
        approverUserId,
        approvalName,
        approvalLevel,
        status,
        action,
        rejectionReason,
        passwordVerified,
        otpVerified,
        signedAt,
        expiresAt,
      ];
}

/// Representa el detalle completo de una operación
class DocumentDetailEntity extends Equatable {
  final String operationId;
  final String operationName;
  final String operationDate;
  final String status;
  final String sourceAccountNumber;
  final String sourceAccountType;
  final String? beneficiaryName;
  final String transferType;
  final double amount;
  final String currency;
  final String? destinationAccountNumber;
  final int approvalLevelsRequired;
  final int currentApprovalLevel;
  final String? expiresAt;
  final String? approvedAt;
  final String? rejectedAt;
  final List<ApprovalEntity> approvals;

  const DocumentDetailEntity({
    required this.operationId,
    required this.operationName,
    required this.operationDate,
    required this.status,
    required this.sourceAccountNumber,
    required this.sourceAccountType,
    this.beneficiaryName,
    required this.transferType,
    required this.amount,
    required this.currency,
    this.destinationAccountNumber,
    required this.approvalLevelsRequired,
    required this.currentApprovalLevel,
    this.expiresAt,
    this.approvedAt,
    this.rejectedAt,
    this.approvals = const [],
  });

  @override
  List<Object?> get props => [
        operationId,
        operationName,
        operationDate,
        status,
        sourceAccountNumber,
        sourceAccountType,
        beneficiaryName,
        transferType,
        amount,
        currency,
        destinationAccountNumber,
        approvalLevelsRequired,
        currentApprovalLevel,
        expiresAt,
        approvedAt,
        rejectedAt,
        approvals,
      ];
}
