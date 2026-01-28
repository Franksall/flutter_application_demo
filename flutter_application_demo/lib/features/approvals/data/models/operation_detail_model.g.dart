// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsOperationImpl _$$BsOperationImplFromJson(Map<String, dynamic> json) =>
    _$BsOperationImpl(
      operationId: json['operationId'] as String,
      operationName: json['operationName'] as String,
      operationDate: json['operationDate'] as String,
      status: $enumDecode(_$BsOperationStatusEnumMap, json['status']),
      sourceAccountNumber: json['sourceAccountNumber'] as String,
      sourceAccountType: $enumDecode(
        _$BsAccountTypeEnumMap,
        json['sourceAccountType'],
      ),
      beneficiaryName: json['beneficiaryName'] as String?,
      transferType: $enumDecode(_$BsTransferTypeEnumMap, json['transferType']),
      amount: (json['amount'] as num).toDouble(),
      currency: $enumDecode(_$BsCurrencyTypeEnumMap, json['currency']),
      destinationAccountNumber: json['destinationAccountNumber'] as String?,
      approvalLevelsRequired: (json['approvalLevelsRequired'] as num).toInt(),
      currentApprovalLevel: (json['currentApprovalLevel'] as num).toInt(),
      expiresAt: json['expiresAt'] as String?,
      approvedAt: json['approvedAt'] as String?,
      rejectedAt: json['rejectedAt'] as String?,
      approvals: (json['approvals'] as List<dynamic>?)
          ?.map((e) => BsApproval.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BsOperationImplToJson(_$BsOperationImpl instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'operationName': instance.operationName,
      'operationDate': instance.operationDate,
      'status': _$BsOperationStatusEnumMap[instance.status]!,
      'sourceAccountNumber': instance.sourceAccountNumber,
      'sourceAccountType': _$BsAccountTypeEnumMap[instance.sourceAccountType]!,
      'beneficiaryName': instance.beneficiaryName,
      'transferType': _$BsTransferTypeEnumMap[instance.transferType]!,
      'amount': instance.amount,
      'currency': _$BsCurrencyTypeEnumMap[instance.currency]!,
      'destinationAccountNumber': instance.destinationAccountNumber,
      'approvalLevelsRequired': instance.approvalLevelsRequired,
      'currentApprovalLevel': instance.currentApprovalLevel,
      'expiresAt': instance.expiresAt,
      'approvedAt': instance.approvedAt,
      'rejectedAt': instance.rejectedAt,
      'approvals': instance.approvals,
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

const _$BsAccountTypeEnumMap = {
  BsAccountType.savings: 'SAVINGS',
  BsAccountType.current: 'CURRENT',
  BsAccountType.cts: 'CTS',
  BsAccountType.salary: 'SALARY',
};

const _$BsTransferTypeEnumMap = {
  BsTransferType.payrollPayment: 'PAYROLL_PAYMENT',
  BsTransferType.ctsPayment: 'CTS_PAYMENT',
  BsTransferType.interbankTransfer: 'INTERBANK_TRANSFER',
  BsTransferType.ownTransfer: 'OWN_TRANSFER',
};

const _$BsCurrencyTypeEnumMap = {
  BsCurrencyType.pen: 'PEN',
  BsCurrencyType.usd: 'USD',
};

_$BsGetOperationDetailResponseImpl _$$BsGetOperationDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BsGetOperationDetailResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : BsOperation.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$BsGetOperationDetailResponseImplToJson(
  _$BsGetOperationDetailResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
