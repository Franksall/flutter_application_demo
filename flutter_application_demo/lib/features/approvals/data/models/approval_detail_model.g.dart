// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsApprovalImpl _$$BsApprovalImplFromJson(Map<String, dynamic> json) =>
    _$BsApprovalImpl(
      approvalId: json['approvalId'] as String,
      operationId: json['operationId'] as String,
      approverUserId: json['approverUserId'] as String,
      approvalName: json['approvalName'] as String,
      approvalLevel: (json['approvalLevel'] as num).toInt(),
      status: $enumDecode(_$BsApprovalStatusEnumMap, json['status']),
      action: $enumDecodeNullable(_$BsApprovalActionEnumMap, json['action']),
      rejectionReason: json['rejectionReason'] as String?,
      passwordVerified: json['passwordVerified'] as bool?,
      otpVerified: json['otpVerified'] as bool?,
      signedAt: json['signedAt'] as String?,
      expiresAt: json['expiresAt'] as String?,
    );

Map<String, dynamic> _$$BsApprovalImplToJson(_$BsApprovalImpl instance) =>
    <String, dynamic>{
      'approvalId': instance.approvalId,
      'operationId': instance.operationId,
      'approverUserId': instance.approverUserId,
      'approvalName': instance.approvalName,
      'approvalLevel': instance.approvalLevel,
      'status': _$BsApprovalStatusEnumMap[instance.status]!,
      'action': _$BsApprovalActionEnumMap[instance.action],
      'rejectionReason': instance.rejectionReason,
      'passwordVerified': instance.passwordVerified,
      'otpVerified': instance.otpVerified,
      'signedAt': instance.signedAt,
      'expiresAt': instance.expiresAt,
    };

const _$BsApprovalStatusEnumMap = {
  BsApprovalStatus.approved: 'APPROVED',
  BsApprovalStatus.rejected: 'REJECTED',
  BsApprovalStatus.expired: 'EXPIRED',
  BsApprovalStatus.cancelled: 'CANCELLED',
};

const _$BsApprovalActionEnumMap = {
  BsApprovalAction.approve: 'APPROVE',
  BsApprovalAction.reject: 'REJECT',
};
