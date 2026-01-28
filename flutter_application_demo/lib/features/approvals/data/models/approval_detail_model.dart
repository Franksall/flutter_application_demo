import 'package:freezed_annotation/freezed_annotation.dart';

part 'approval_detail_model.freezed.dart';
part 'approval_detail_model.g.dart';

/// Estados posibles de una firma individual
enum BsApprovalStatus {
  @JsonValue('APPROVED')
  approved,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('EXPIRED')
  expired,
  @JsonValue('CANCELLED')
  cancelled,
}

/// Acciones posibles para una firma
enum BsApprovalAction {
  @JsonValue('APPROVE')
  approve,
  @JsonValue('REJECT')
  reject,
}

/// Firma individual de aprobación
@freezed
class BsApproval with _$BsApproval {
  const factory BsApproval({
    required String approvalId,
    required String operationId,
    required String approverUserId,
    required String approvalName,
    required int approvalLevel,
    required BsApprovalStatus status,
    BsApprovalAction? action,
    String? rejectionReason,
    bool? passwordVerified,
    bool? otpVerified,
    String? signedAt,
    String? expiresAt,
  }) = _BsApproval;

  factory BsApproval.fromJson(Map<String, dynamic> json) =>
      _$BsApprovalFromJson(json);
}
