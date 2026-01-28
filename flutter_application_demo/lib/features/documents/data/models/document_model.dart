import 'package:flutter_application_demo/features/documents/domain/entities/document_entity.dart';

class DocumentModel extends DocumentEntity {
  const DocumentModel({
    required super.id,
    required super.title,
    required super.type,
    required super.operationDate,
    required super.currency,
    required super.amount,
    super.commission,
    required super.operation,
    required super.createdAt,
    required super.status,
    super.sourceAccount,
    super.destinationAccount,
    required super.approvalLevelsRequired,
    required super.currentApprovalLevel,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      operationDate: json['operationDate'] as String,
      currency: json['currency'] as String,
      amount: (json['amount'] as num).toDouble(),
      commission: json['commission'] != null ? (json['commission'] as num).toDouble() : null,
      operation: json['operation'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: _parseStatus(json['status'] as String),
      sourceAccount: json['sourceAccount'] != null
          ? SourceAccount(
              accountNumber: json['sourceAccount']['accountNumber'] as String,
            )
          : null,
      destinationAccount: json['destinationAccount'] != null
          ? DestinationAccount(
              accountNumber: json['destinationAccount']['accountNumber'] as String?,
              beneficiaryName: json['destinationAccount']['beneficiaryName'] as String?,
            )
          : null,
      approvalLevelsRequired: json['approvalLevelsRequired'] as int,
      currentApprovalLevel: json['currentApprovalLevel'] as int,
    );
  }

  static DocumentStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return DocumentStatus.pending;
      case 'approved':
        return DocumentStatus.approved;
      case 'rejected':
        return DocumentStatus.rejected;
      case 'processing':
        return DocumentStatus.processing;
      case 'completed':
        return DocumentStatus.completed;
      case 'failed':
        return DocumentStatus.failed;
      case 'cancelled':
        return DocumentStatus.cancelled;
      default:
        return DocumentStatus.pending;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'operationDate': operationDate,
      'currency': currency,
      'amount': amount,
      'commission': commission,
      'operation': operation,
      'createdAt': createdAt.toIso8601String(),
      'status': status.name,
      'sourceAccount': sourceAccount != null
          ? {
              'accountNumber': sourceAccount!.accountNumber,
            }
          : null,
      'destinationAccount': destinationAccount != null
          ? {
              'accountNumber': destinationAccount!.accountNumber,
              'beneficiaryName': destinationAccount!.beneficiaryName,
            }
          : null,
      'approvalLevelsRequired': approvalLevelsRequired,
      'currentApprovalLevel': currentApprovalLevel,
    };
  }
}
