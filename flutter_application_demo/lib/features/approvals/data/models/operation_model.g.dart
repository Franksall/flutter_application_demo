// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsAccountSummaryImpl _$$BsAccountSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$BsAccountSummaryImpl(accountNumber: json['accountNumber'] as String);

Map<String, dynamic> _$$BsAccountSummaryImplToJson(
  _$BsAccountSummaryImpl instance,
) => <String, dynamic>{'accountNumber': instance.accountNumber};

_$BsDestinationAccountSummaryImpl _$$BsDestinationAccountSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$BsDestinationAccountSummaryImpl(
  accountNumber: json['accountNumber'] as String?,
  beneficiaryName: json['beneficiaryName'] as String?,
);

Map<String, dynamic> _$$BsDestinationAccountSummaryImplToJson(
  _$BsDestinationAccountSummaryImpl instance,
) => <String, dynamic>{
  'accountNumber': instance.accountNumber,
  'beneficiaryName': instance.beneficiaryName,
};

_$BsOperationSummaryImpl _$$BsOperationSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$BsOperationSummaryImpl(
  operationId: json['operationId'] as String,
  operationName: json['operationName'] as String,
  operationDate: json['operationDate'] as String,
  operationType: $enumDecode(_$BsOperationTypeEnumMap, json['operationType']),
  status: $enumDecode(_$BsOperationStatusEnumMap, json['status']),
  currency: $enumDecodeNullable(_$BsCurrencyTypeEnumMap, json['currency']),
  amount: (json['amount'] as num?)?.toDouble(),
  commision: (json['commision'] as num?)?.toDouble(),
  sourceAccount: json['sourceAccount'] == null
      ? null
      : BsAccountSummary.fromJson(
          json['sourceAccount'] as Map<String, dynamic>,
        ),
  destinationAccount: json['destinationAccount'] == null
      ? null
      : BsDestinationAccountSummary.fromJson(
          json['destinationAccount'] as Map<String, dynamic>,
        ),
  approvalLevelsRequired: (json['approvalLevelsRequired'] as num).toInt(),
  currentApprovalLevel: (json['currentApprovalLevel'] as num).toInt(),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$BsOperationSummaryImplToJson(
  _$BsOperationSummaryImpl instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'operationName': instance.operationName,
  'operationDate': instance.operationDate,
  'operationType': _$BsOperationTypeEnumMap[instance.operationType]!,
  'status': _$BsOperationStatusEnumMap[instance.status]!,
  'currency': _$BsCurrencyTypeEnumMap[instance.currency],
  'amount': instance.amount,
  'commision': instance.commision,
  'sourceAccount': instance.sourceAccount,
  'destinationAccount': instance.destinationAccount,
  'approvalLevelsRequired': instance.approvalLevelsRequired,
  'currentApprovalLevel': instance.currentApprovalLevel,
  'createdAt': instance.createdAt,
};

const _$BsOperationTypeEnumMap = {
  BsOperationType.payrollPayment: 'PAYROLL_PAYMENT',
  BsOperationType.ctsPayment: 'CTS_PAYMENT',
  BsOperationType.interbankTransfer: 'INTERBANK_TRANSFER',
  BsOperationType.ownTransfer: 'OWN_TRANSFER',
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

const _$BsCurrencyTypeEnumMap = {
  BsCurrencyType.pen: 'PEN',
  BsCurrencyType.usd: 'USD',
};
