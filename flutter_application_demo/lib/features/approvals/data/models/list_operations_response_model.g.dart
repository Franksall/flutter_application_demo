// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_operations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BsListOperationsResponseDataImpl _$$BsListOperationsResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$BsListOperationsResponseDataImpl(
  operations: (json['operations'] as List<dynamic>)
      .map((e) => BsOperationSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: PaginationInfo.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$BsListOperationsResponseDataImplToJson(
  _$BsListOperationsResponseDataImpl instance,
) => <String, dynamic>{
  'operations': instance.operations,
  'pagination': instance.pagination,
};

_$BsListOperationsResponseImpl _$$BsListOperationsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BsListOperationsResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : BsListOperationsResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$BsListOperationsResponseImplToJson(
  _$BsListOperationsResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
