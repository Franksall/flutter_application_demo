import 'package:flutter_application_demo/features/documents/domain/entities/document_detail_entity.dart';

class ApprovalModel extends ApprovalEntity {
  const ApprovalModel({
    required super.approvalId,
    required super.operationId,
    required super.approverUserId,
    required super.approvalName,
    required super.approvalLevel,
    required super.status,
    super.action,
    super.rejectionReason,
    super.passwordVerified,
    super.otpVerified,
    super.signedAt,
    super.expiresAt,
  });

  factory ApprovalModel.fromJson(Map<String, dynamic> json) {
    return ApprovalModel(
      approvalId: json['approvalId'] as String,
      operationId: json['operationId'] as String,
      approverUserId: json['approverUserId'] as String,
      approvalName: json['approvalName'] as String,
      approvalLevel: json['approvalLevel'] as int,
      status: json['status'] as String,
      action: json['action'] as String?,
      rejectionReason: json['rejectionReason'] as String?,
      passwordVerified: json['passwordVerified'] as bool?,
      otpVerified: json['otpVerified'] as bool?,
      signedAt: json['signedAt'] as String?,
      expiresAt: json['expiresAt'] as String?,
    );
  }
}

class DocumentDetailModel extends DocumentDetailEntity {
  const DocumentDetailModel({
    required super.operationId,
    required super.operationName,
    required super.operationDate,
    required super.status,
    required super.sourceAccountNumber,
    required super.sourceAccountType,
    super.beneficiaryName,
    required super.transferType,
    required super.amount,
    required super.currency,
    super.destinationAccountNumber,
    required super.approvalLevelsRequired,
    required super.currentApprovalLevel,
    super.expiresAt,
    super.approvedAt,
    super.rejectedAt,
    super.approvals = const [],
  });

  factory DocumentDetailModel.fromJson(Map<String, dynamic> json) {
    final approvalsJson = json['approvals'] as List<dynamic>?;
    final approvals = approvalsJson
            ?.map((e) => ApprovalModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return DocumentDetailModel(
      operationId: json['operationId'] as String,
      operationName: json['operationName'] as String,
      operationDate: json['operationDate'] as String,
      status: json['status'] as String,
      sourceAccountNumber: json['sourceAccountNumber'] as String,
      sourceAccountType: json['sourceAccountType'] as String,
      beneficiaryName: json['beneficiaryName'] as String?,
      transferType: json['transferType'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      destinationAccountNumber: json['destinationAccountNumber'] as String?,
      approvalLevelsRequired: json['approvalLevelsRequired'] as int,
      currentApprovalLevel: json['currentApprovalLevel'] as int,
      expiresAt: json['expiresAt'] as String?,
      approvedAt: json['approvedAt'] as String?,
      rejectedAt: json['rejectedAt'] as String?,
      approvals: approvals,
    );
  }
}
