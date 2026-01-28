// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
    ApiResponse<T> value,
    $Res Function(ApiResponse<T>) then,
  ) = _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({bool success, String message, T? data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
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
                      as T?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(
    _$ApiResponseImpl<T> value,
    $Res Function(_$ApiResponseImpl<T>) then,
  ) = __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool success, String message, T? data});
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
    _$ApiResponseImpl<T> _value,
    $Res Function(_$ApiResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _$ApiResponseImpl<T>(
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
                  as T?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl({
    required this.success,
    required this.message,
    this.data,
  });

  factory _$ApiResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$ApiResponseImplFromJson(json, fromJsonT);

  @override
  final bool success;
  @override
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiResponse<$T>(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    const DeepCollectionEquality().hash(data),
  );

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse({
    required final bool success,
    required final String message,
    final T? data,
  }) = _$ApiResponseImpl<T>;

  factory _ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$ApiResponseImpl<T>.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  T? get data;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiErrorItem _$ApiErrorItemFromJson(Map<String, dynamic> json) {
  return _ApiErrorItem.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorItem {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get field => throw _privateConstructorUsedError;

  /// Serializes this ApiErrorItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorItemCopyWith<ApiErrorItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorItemCopyWith<$Res> {
  factory $ApiErrorItemCopyWith(
    ApiErrorItem value,
    $Res Function(ApiErrorItem) then,
  ) = _$ApiErrorItemCopyWithImpl<$Res, ApiErrorItem>;
  @useResult
  $Res call({String code, String message, String? field});
}

/// @nodoc
class _$ApiErrorItemCopyWithImpl<$Res, $Val extends ApiErrorItem>
    implements $ApiErrorItemCopyWith<$Res> {
  _$ApiErrorItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? field = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            field: freezed == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiErrorItemImplCopyWith<$Res>
    implements $ApiErrorItemCopyWith<$Res> {
  factory _$$ApiErrorItemImplCopyWith(
    _$ApiErrorItemImpl value,
    $Res Function(_$ApiErrorItemImpl) then,
  ) = __$$ApiErrorItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String? field});
}

/// @nodoc
class __$$ApiErrorItemImplCopyWithImpl<$Res>
    extends _$ApiErrorItemCopyWithImpl<$Res, _$ApiErrorItemImpl>
    implements _$$ApiErrorItemImplCopyWith<$Res> {
  __$$ApiErrorItemImplCopyWithImpl(
    _$ApiErrorItemImpl _value,
    $Res Function(_$ApiErrorItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? field = freezed,
  }) {
    return _then(
      _$ApiErrorItemImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorItemImpl implements _ApiErrorItem {
  const _$ApiErrorItemImpl({
    required this.code,
    required this.message,
    this.field,
  });

  factory _$ApiErrorItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorItemImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final String? field;

  @override
  String toString() {
    return 'ApiErrorItem(code: $code, message: $message, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorItemImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, field);

  /// Create a copy of ApiErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorItemImplCopyWith<_$ApiErrorItemImpl> get copyWith =>
      __$$ApiErrorItemImplCopyWithImpl<_$ApiErrorItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorItemImplToJson(this);
  }
}

abstract class _ApiErrorItem implements ApiErrorItem {
  const factory _ApiErrorItem({
    required final String code,
    required final String message,
    final String? field,
  }) = _$ApiErrorItemImpl;

  factory _ApiErrorItem.fromJson(Map<String, dynamic> json) =
      _$ApiErrorItemImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String? get field;

  /// Create a copy of ApiErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorItemImplCopyWith<_$ApiErrorItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) {
  return _PaginationInfo.fromJson(json);
}

/// @nodoc
mixin _$PaginationInfo {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  bool? get hasNext => throw _privateConstructorUsedError;
  bool? get hasPrevious => throw _privateConstructorUsedError;

  /// Serializes this PaginationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationInfoCopyWith<PaginationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInfoCopyWith<$Res> {
  factory $PaginationInfoCopyWith(
    PaginationInfo value,
    $Res Function(PaginationInfo) then,
  ) = _$PaginationInfoCopyWithImpl<$Res, PaginationInfo>;
  @useResult
  $Res call({
    int page,
    int limit,
    int total,
    int pages,
    bool? hasNext,
    bool? hasPrevious,
  });
}

/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res, $Val extends PaginationInfo>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? pages = null,
    Object? hasNext = freezed,
    Object? hasPrevious = freezed,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
            hasNext: freezed == hasNext
                ? _value.hasNext
                : hasNext // ignore: cast_nullable_to_non_nullable
                      as bool?,
            hasPrevious: freezed == hasPrevious
                ? _value.hasPrevious
                : hasPrevious // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginationInfoImplCopyWith<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  factory _$$PaginationInfoImplCopyWith(
    _$PaginationInfoImpl value,
    $Res Function(_$PaginationInfoImpl) then,
  ) = __$$PaginationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    int limit,
    int total,
    int pages,
    bool? hasNext,
    bool? hasPrevious,
  });
}

/// @nodoc
class __$$PaginationInfoImplCopyWithImpl<$Res>
    extends _$PaginationInfoCopyWithImpl<$Res, _$PaginationInfoImpl>
    implements _$$PaginationInfoImplCopyWith<$Res> {
  __$$PaginationInfoImplCopyWithImpl(
    _$PaginationInfoImpl _value,
    $Res Function(_$PaginationInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? pages = null,
    Object? hasNext = freezed,
    Object? hasPrevious = freezed,
  }) {
    return _then(
      _$PaginationInfoImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
        hasNext: freezed == hasNext
            ? _value.hasNext
            : hasNext // ignore: cast_nullable_to_non_nullable
                  as bool?,
        hasPrevious: freezed == hasPrevious
            ? _value.hasPrevious
            : hasPrevious // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationInfoImpl implements _PaginationInfo {
  const _$PaginationInfoImpl({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
    this.hasNext,
    this.hasPrevious,
  });

  factory _$PaginationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationInfoImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int pages;
  @override
  final bool? hasNext;
  @override
  final bool? hasPrevious;

  @override
  String toString() {
    return 'PaginationInfo(page: $page, limit: $limit, total: $total, pages: $pages, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationInfoImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, limit, total, pages, hasNext, hasPrevious);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      __$$PaginationInfoImplCopyWithImpl<_$PaginationInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationInfoImplToJson(this);
  }
}

abstract class _PaginationInfo implements PaginationInfo {
  const factory _PaginationInfo({
    required final int page,
    required final int limit,
    required final int total,
    required final int pages,
    final bool? hasNext,
    final bool? hasPrevious,
  }) = _$PaginationInfoImpl;

  factory _PaginationInfo.fromJson(Map<String, dynamic> json) =
      _$PaginationInfoImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get pages;
  @override
  bool? get hasNext;
  @override
  bool? get hasPrevious;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
