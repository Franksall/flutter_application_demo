import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

/// Estados posibles de una operación de aprobación
enum BsOperationStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('PROCESSING')
  processing,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('FAILED')
  failed,
  @JsonValue('CANCELLED')
  cancelled,
}

/// Tipos de operación que requieren aprobación
enum BsOperationType {
  @JsonValue('PAYROLL_PAYMENT')
  payrollPayment,
  @JsonValue('CTS_PAYMENT')
  ctsPayment,
  @JsonValue('INTERBANK_TRANSFER')
  interbankTransfer,
  @JsonValue('OWN_TRANSFER')
  ownTransfer,
}

/// Tipo de moneda
enum BsCurrencyType {
  @JsonValue('PEN')
  pen,
  @JsonValue('USD')
  usd,
}

/// Tipos de cuenta bancaria
enum BsAccountType {
  @JsonValue('SAVINGS')
  savings,
  @JsonValue('CURRENT')
  current,
  @JsonValue('CTS')
  cts,
  @JsonValue('SALARY')
  salary,
}

/// Tipos de transferencia
enum BsTransferType {
  @JsonValue('PAYROLL_PAYMENT')
  payrollPayment,
  @JsonValue('CTS_PAYMENT')
  ctsPayment,
  @JsonValue('INTERBANK_TRANSFER')
  interbankTransfer,
  @JsonValue('OWN_TRANSFER')
  ownTransfer,
}

/// Resumen de cuenta
@freezed
class BsAccountSummary with _$BsAccountSummary {
  const factory BsAccountSummary({
    required String accountNumber,
  }) = _BsAccountSummary;

  factory BsAccountSummary.fromJson(Map<String, dynamic> json) =>
      _$BsAccountSummaryFromJson(json);
}

/// Resumen de cuenta de destino
@freezed
class BsDestinationAccountSummary with _$BsDestinationAccountSummary {
  const factory BsDestinationAccountSummary({
    String? accountNumber,
    String? beneficiaryName,
  }) = _BsDestinationAccountSummary;

  factory BsDestinationAccountSummary.fromJson(Map<String, dynamic> json) =>
      _$BsDestinationAccountSummaryFromJson(json);
}

/// Resumen de operación para listados
@freezed
class BsOperationSummary with _$BsOperationSummary {
  const factory BsOperationSummary({
    required String operationId,
    required String operationName,
    required String operationDate,
    required BsOperationType operationType,
    required BsOperationStatus status,
    BsCurrencyType? currency,
    double? amount,
    double? commision,
    BsAccountSummary? sourceAccount,
    BsDestinationAccountSummary? destinationAccount,
    required int approvalLevelsRequired,
    required int currentApprovalLevel,
    required String createdAt,
  }) = _BsOperationSummary;

  factory BsOperationSummary.fromJson(Map<String, dynamic> json) =>
      _$BsOperationSummaryFromJson(json);
}
