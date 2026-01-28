import 'package:freezed_annotation/freezed_annotation.dart';
import 'operation_model.dart';
import 'approval_detail_model.dart';

part 'operation_detail_model.freezed.dart';
part 'operation_detail_model.g.dart';

/// Operación completa con todos los detalles
@freezed
class BsOperation with _$BsOperation {
  const factory BsOperation({
    required String operationId,
    required String operationName,
    required String operationDate,
    required BsOperationStatus status,
    required String sourceAccountNumber,
    required BsAccountType sourceAccountType,
    String? beneficiaryName,
    required BsTransferType transferType,
    required double amount,
    required BsCurrencyType currency,
    String? destinationAccountNumber,
    required int approvalLevelsRequired,
    required int currentApprovalLevel,
    String? expiresAt,
    String? approvedAt,
    String? rejectedAt,
    List<BsApproval>? approvals,
  }) = _BsOperation;

  factory BsOperation.fromJson(Map<String, dynamic> json) =>
      _$BsOperationFromJson(json);
}

/// Respuesta para obtener detalle de operación
@freezed
class BsGetOperationDetailResponse with _$BsGetOperationDetailResponse {
  const factory BsGetOperationDetailResponse({
    required bool success,
    required String message,
    BsOperation? data,
  }) = _BsGetOperationDetailResponse;

  factory BsGetOperationDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BsGetOperationDetailResponseFromJson(json);
}
