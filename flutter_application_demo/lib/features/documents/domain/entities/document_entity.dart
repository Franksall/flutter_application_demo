import 'package:equatable/equatable.dart';

enum DocumentStatus { pending, approved, rejected, processing, completed, failed, cancelled }

/// Representa una cuenta bancaria de origen
class SourceAccount extends Equatable {
  final String accountNumber;

  const SourceAccount({
    required this.accountNumber,
  });

  @override
  List<Object?> get props => [accountNumber];
}

/// Representa una cuenta bancaria de destino
class DestinationAccount extends Equatable {
  final String? accountNumber;
  final String? beneficiaryName;

  const DestinationAccount({
    this.accountNumber,
    this.beneficiaryName,
  });

  @override
  List<Object?> get props => [accountNumber, beneficiaryName];
}

class DocumentEntity extends Equatable {
  final String id;
  final String title;
  final String type;
  final String operationDate;
  final String currency;
  final double amount;
  final double? commission;
  final String operation;
  final DateTime createdAt;
  final DocumentStatus status;
  final SourceAccount? sourceAccount;
  final DestinationAccount? destinationAccount;
  final int approvalLevelsRequired;
  final int currentApprovalLevel;

  const DocumentEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.operationDate,
    required this.currency,
    required this.amount,
    this.commission,
    required this.operation,
    required this.createdAt,
    required this.status,
    this.sourceAccount,
    this.destinationAccount,
    required this.approvalLevelsRequired,
    required this.currentApprovalLevel,
  });

  // Helper getters para retrocompatibilidad
  String get accountNumber => sourceAccount?.accountNumber ?? '';
  String? get employerName => destinationAccount?.beneficiaryName;
  String? get destinationAccountNumber => destinationAccount?.accountNumber;
  String? get beneficiaryName => destinationAccount?.beneficiaryName;

  @override
  List<Object?> get props => [
        id,
        title,
        type,
        operationDate,
        currency,
        amount,
        commission,
        operation,
        createdAt,
        status,
        sourceAccount,
        destinationAccount,
        approvalLevelsRequired,
        currentApprovalLevel,
      ];
}
