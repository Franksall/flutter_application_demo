// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$ApiResponseImpl<T>(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_$ApiErrorItemImpl _$$ApiErrorItemImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorItemImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      field: json['field'] as String?,
    );

Map<String, dynamic> _$$ApiErrorItemImplToJson(_$ApiErrorItemImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'field': instance.field,
    };

_$PaginationInfoImpl _$$PaginationInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaginationInfoImpl(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      hasNext: json['hasNext'] as bool?,
      hasPrevious: json['hasPrevious'] as bool?,
    );

Map<String, dynamic> _$$PaginationInfoImplToJson(
  _$PaginationInfoImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'pages': instance.pages,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};
