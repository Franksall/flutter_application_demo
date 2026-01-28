// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_sign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsApprovalSignRequestImpl _$$BsApprovalSignRequestImplFromJson(
  Map<String, dynamic> json,
) => _$BsApprovalSignRequestImpl(
  action: $enumDecode(_$BsApprovalActionEnumMap, json['action']),
  approverUserId: json['approverUserId'] as String,
  operationTarget: $enumDecodeNullable(
    _$BsOperationTargetEnumMap,
    json['operationTarget'],
  ),
);

Map<String, dynamic> _$$BsApprovalSignRequestImplToJson(
  _$BsApprovalSignRequestImpl instance,
) => <String, dynamic>{
  'action': _$BsApprovalActionEnumMap[instance.action]!,
  'approverUserId': instance.approverUserId,
  'operationTarget': _$BsOperationTargetEnumMap[instance.operationTarget],
};

const _$BsApprovalActionEnumMap = {
  BsApprovalAction.approve: 'APPROVE',
  BsApprovalAction.reject: 'REJECT',
};

const _$BsOperationTargetEnumMap = {
  BsOperationTarget.transfer: 'TRANSFER',
  BsOperationTarget.payroll: 'PAYROLL',
};

_$BsSignApprovalResponseDataImpl _$$BsSignApprovalResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$BsSignApprovalResponseDataImpl(
  correlationId: json['correlationId'] as String?,
  approvalId: json['approvalId'] as String,
  operationId: json['operationId'] as String,
  operationType: $enumDecodeNullable(
    _$BsOperationTypeEnumMap,
    json['operationType'],
  ),
  action: $enumDecode(_$BsApprovalStatusEnumMap, json['action']),
  operationStatus: $enumDecode(
    _$BsOperationStatusEnumMap,
    json['operationStatus'],
  ),
  approvalLevel: (json['approvalLevel'] as num).toInt(),
  approvalName: json['approvalName'] as String,
  approvalMail: json['approvalMail'] as String?,
  signedAt: json['signedAt'] as String,
  rejectedAt: json['rejectedAt'] as String?,
  approvalLevelsRequired: (json['approvalLevelsRequired'] as num?)?.toInt(),
  approvedAt: json['approvedAt'] as String?,
);

Map<String, dynamic> _$$BsSignApprovalResponseDataImplToJson(
  _$BsSignApprovalResponseDataImpl instance,
) => <String, dynamic>{
  'correlationId': instance.correlationId,
  'approvalId': instance.approvalId,
  'operationId': instance.operationId,
  'operationType': _$BsOperationTypeEnumMap[instance.operationType],
  'action': _$BsApprovalStatusEnumMap[instance.action]!,
  'operationStatus': _$BsOperationStatusEnumMap[instance.operationStatus]!,
  'approvalLevel': instance.approvalLevel,
  'approvalName': instance.approvalName,
  'approvalMail': instance.approvalMail,
  'signedAt': instance.signedAt,
  'rejectedAt': instance.rejectedAt,
  'approvalLevelsRequired': instance.approvalLevelsRequired,
  'approvedAt': instance.approvedAt,
};

const _$BsOperationTypeEnumMap = {
  BsOperationType.payrollPayment: 'PAYROLL_PAYMENT',
  BsOperationType.ctsPayment: 'CTS_PAYMENT',
  BsOperationType.interbankTransfer: 'INTERBANK_TRANSFER',
  BsOperationType.ownTransfer: 'OWN_TRANSFER',
};

const _$BsApprovalStatusEnumMap = {
  BsApprovalStatus.approved: 'APPROVED',
  BsApprovalStatus.rejected: 'REJECTED',
  BsApprovalStatus.expired: 'EXPIRED',
  BsApprovalStatus.cancelled: 'CANCELLED',
};

const _$BsOperationStatusEnumMap = {
  BsOperationStatus.pending: 'PENDING',
  BsOperationStatus.approved: 'APPROVED',
  BsOperationStatus.rejected: 'REJECTED',
  BsOperationStatus.processing: 'PROCESSING',
  BsOperationStatus.completed: 'COMPLETED',
  BsOperationStatus.failed: 'FAILED',
  BsOperationStatus.cancelled: 'CANCELLED',
};

_$BsSignApprovalResponseImpl _$$BsSignApprovalResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BsSignApprovalResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : BsSignApprovalResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$BsSignApprovalResponseImplToJson(
  _$BsSignApprovalResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
