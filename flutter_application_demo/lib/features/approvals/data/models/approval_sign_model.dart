import 'package:freezed_annotation/freezed_annotation.dart';
import 'approval_detail_model.dart';
import 'operation_model.dart';

part 'approval_sign_model.freezed.dart';
part 'approval_sign_model.g.dart';

/// Target de la operación
enum BsOperationTarget {
  @JsonValue('TRANSFER')
  transfer,
  @JsonValue('PAYROLL')
  payroll,
}

/// Solicitud para firmar una aprobación (aprobar o rechazar)
@freezed
class BsApprovalSignRequest with _$BsApprovalSignRequest {
  const factory BsApprovalSignRequest({
    required BsApprovalAction action,
    required String approverUserId,
    BsOperationTarget? operationTarget,
  }) = _BsApprovalSignRequest;

  factory BsApprovalSignRequest.fromJson(Map<String, dynamic> json) =>
      _$BsApprovalSignRequestFromJson(json);
}

/// Datos de respuesta al firmar una aprobación
@freezed
class BsSignApprovalResponseData with _$BsSignApprovalResponseData {
  const factory BsSignApprovalResponseData({
    String? correlationId,
    required String approvalId,
    required String operationId,
    BsOperationType? operationType,
    required BsApprovalStatus action,
    required BsOperationStatus operationStatus,
    required int approvalLevel,
    required String approvalName,
    String? approvalMail,
    required String signedAt,
    String? rejectedAt,
    int? approvalLevelsRequired,
    String? approvedAt,
  }) = _BsSignApprovalResponseData;

  factory BsSignApprovalResponseData.fromJson(Map<String, dynamic> json) =>
      _$BsSignApprovalResponseDataFromJson(json);
}

/// Respuesta completa al firmar una aprobación
@freezed
class BsSignApprovalResponse with _$BsSignApprovalResponse {
  const factory BsSignApprovalResponse({
    required bool success,
    required String message,
    BsSignApprovalResponseData? data,
  }) = _BsSignApprovalResponse;

  factory BsSignApprovalResponse.fromJson(Map<String, dynamic> json) =>
      _$BsSignApprovalResponseFromJson(json);
}
