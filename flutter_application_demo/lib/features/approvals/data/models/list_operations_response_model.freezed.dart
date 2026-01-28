// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_operations_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BsListOperationsResponseData _$BsListOperationsResponseDataFromJson(
  Map<String, dynamic> json,
) {
  return _BsListOperationsResponseData.fromJson(json);
}

/// @nodoc
mixin _$BsListOperationsResponseData {
  List<BsOperationSummary> get operations => throw _privateConstructorUsedError;
  PaginationInfo get pagination => throw _privateConstructorUsedError;

  /// Serializes this BsListOperationsResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsListOperationsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsListOperationsResponseDataCopyWith<BsListOperationsResponseData>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsListOperationsResponseDataCopyWith<$Res> {
  factory $BsListOperationsResponseDataCopyWith(
    BsListOperationsResponseData value,
    $Res Function(BsListOperationsResponseData) then,
  ) =
      _$BsListOperationsResponseDataCopyWithImpl<
        $Res,
        BsListOperationsResponseData
      >;
  @useResult
  $Res call({List<BsOperationSummary> operations, PaginationInfo pagination});

  $PaginationInfoCopyWith<$Res> get pagination;
}

/// @nodoc
class _$BsListOperationsResponseDataCopyWithImpl<
  $Res,
  $Val extends BsListOperationsResponseData
>
    implements $BsListOperationsResponseDataCopyWith<$Res> {
  _$BsListOperationsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsListOperationsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? operations = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            operations: null == operations
                ? _value.operations
                : operations // ignore: cast_nullable_to_non_nullable
                      as List<BsOperationSummary>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as PaginationInfo,
          )
          as $Val,
    );
  }

  /// Create a copy of BsListOperationsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationInfoCopyWith<$Res> get pagination {
    return $PaginationInfoCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BsListOperationsResponseDataImplCopyWith<$Res>
    implements $BsListOperationsResponseDataCopyWith<$Res> {
  factory _$$BsListOperationsResponseDataImplCopyWith(
    _$BsListOperationsResponseDataImpl value,
    $Res Function(_$BsListOperationsResponseDataImpl) then,
  ) = __$$BsListOperationsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BsOperationSummary> operations, PaginationInfo pagination});

  @override
  $PaginationInfoCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$BsListOperationsResponseDataImplCopyWithImpl<$Res>
    extends
        _$BsListOperationsResponseDataCopyWithImpl<
          $Res,
          _$BsListOperationsResponseDataImpl
        >
    implements _$$BsListOperationsResponseDataImplCopyWith<$Res> {
  __$$BsListOperationsResponseDataImplCopyWithImpl(
    _$BsListOperationsResponseDataImpl _value,
    $Res Function(_$BsListOperationsResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsListOperationsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? operations = null, Object? pagination = null}) {
    return _then(
      _$BsListOperationsResponseDataImpl(
        operations: null == operations
            ? _value._operations
            : operations // ignore: cast_nullable_to_non_nullable
                  as List<BsOperationSummary>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as PaginationInfo,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsListOperationsResponseDataImpl
    implements _BsListOperationsResponseData {
  const _$BsListOperationsResponseDataImpl({
    required final List<BsOperationSummary> operations,
    required this.pagination,
  }) : _operations = operations;

  factory _$BsListOperationsResponseDataImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$BsListOperationsResponseDataImplFromJson(json);

  final List<BsOperationSummary> _operations;
  @override
  List<BsOperationSummary> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  final PaginationInfo pagination;

  @override
  String toString() {
    return 'BsListOperationsResponseData(operations: $operations, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsListOperationsResponseDataImpl &&
            const DeepCollectionEquality().equals(
              other._operations,
              _operations,
            ) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_operations),
    pagination,
  );

  /// Create a copy of BsListOperationsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsListOperationsResponseDataImplCopyWith<
    _$BsListOperationsResponseDataImpl
  >
  get copyWith =>
      __$$BsListOperationsResponseDataImplCopyWithImpl<
        _$BsListOperationsResponseDataImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsListOperationsResponseDataImplToJson(this);
  }
}

abstract class _BsListOperationsResponseData
    implements BsListOperationsResponseData {
  const factory _BsListOperationsResponseData({
    required final List<BsOperationSummary> operations,
    required final PaginationInfo pagination,
  }) = _$BsListOperationsResponseDataImpl;

  factory _BsListOperationsResponseData.fromJson(Map<String, dynamic> json) =
      _$BsListOperationsResponseDataImpl.fromJson;

  @override
  List<BsOperationSummary> get operations;
  @override
  PaginationInfo get pagination;

  /// Create a copy of BsListOperationsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsListOperationsResponseDataImplCopyWith<
    _$BsListOperationsResponseDataImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

BsListOperationsResponse _$BsListOperationsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BsListOperationsResponse.fromJson(json);
}

/// @nodoc
mixin _$BsListOperationsResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BsListOperationsResponseData? get data => throw _privateConstructorUsedError;

  /// Serializes this BsListOperationsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsListOperationsResponseCopyWith<BsListOperationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsListOperationsResponseCopyWith<$Res> {
  factory $BsListOperationsResponseCopyWith(
    BsListOperationsResponse value,
    $Res Function(BsListOperationsResponse) then,
  ) = _$BsListOperationsResponseCopyWithImpl<$Res, BsListOperationsResponse>;
  @useResult
  $Res call({bool success, String message, BsListOperationsResponseData? data});

  $BsListOperationsResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BsListOperationsResponseCopyWithImpl<
  $Res,
  $Val extends BsListOperationsResponse
>
    implements $BsListOperationsResponseCopyWith<$Res> {
  _$BsListOperationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as BsListOperationsResponseData?,
          )
          as $Val,
    );
  }

  /// Create a copy of BsListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BsListOperationsResponseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BsListOperationsResponseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BsListOperationsResponseImplCopyWith<$Res>
    implements $BsListOperationsResponseCopyWith<$Res> {
  factory _$$BsListOperationsResponseImplCopyWith(
    _$BsListOperationsResponseImpl value,
    $Res Function(_$BsListOperationsResponseImpl) then,
  ) = __$$BsListOperationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, BsListOperationsResponseData? data});

  @override
  $BsListOperationsResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BsListOperationsResponseImplCopyWithImpl<$Res>
    extends
        _$BsListOperationsResponseCopyWithImpl<
          $Res,
          _$BsListOperationsResponseImpl
        >
    implements _$$BsListOperationsResponseImplCopyWith<$Res> {
  __$$BsListOperationsResponseImplCopyWithImpl(
    _$BsListOperationsResponseImpl _value,
    $Res Function(_$BsListOperationsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _$BsListOperationsResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as BsListOperationsResponseData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsListOperationsResponseImpl implements _BsListOperationsResponse {
  const _$BsListOperationsResponseImpl({
    required this.success,
    required this.message,
    this.data,
  });

  factory _$BsListOperationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsListOperationsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final BsListOperationsResponseData? data;

  @override
  String toString() {
    return 'BsListOperationsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsListOperationsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of BsListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsListOperationsResponseImplCopyWith<_$BsListOperationsResponseImpl>
  get copyWith =>
      __$$BsListOperationsResponseImplCopyWithImpl<
        _$BsListOperationsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsListOperationsResponseImplToJson(this);
  }
}

abstract class _BsListOperationsResponse implements BsListOperationsResponse {
  const factory _BsListOperationsResponse({
    required final bool success,
    required final String message,
    final BsListOperationsResponseData? data,
  }) = _$BsListOperationsResponseImpl;

  factory _BsListOperationsResponse.fromJson(Map<String, dynamic> json) =
      _$BsListOperationsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  BsListOperationsResponseData? get data;

  /// Create a copy of BsListOperationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsListOperationsResponseImplCopyWith<_$BsListOperationsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
