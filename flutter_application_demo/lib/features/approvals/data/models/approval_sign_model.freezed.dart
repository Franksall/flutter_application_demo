// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approval_sign_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BsApprovalSignRequest _$BsApprovalSignRequestFromJson(
  Map<String, dynamic> json,
) {
  return _BsApprovalSignRequest.fromJson(json);
}

/// @nodoc
mixin _$BsApprovalSignRequest {
  BsApprovalAction get action => throw _privateConstructorUsedError;
  String get approverUserId => throw _privateConstructorUsedError;
  BsOperationTarget? get operationTarget => throw _privateConstructorUsedError;

  /// Serializes this BsApprovalSignRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsApprovalSignRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsApprovalSignRequestCopyWith<BsApprovalSignRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsApprovalSignRequestCopyWith<$Res> {
  factory $BsApprovalSignRequestCopyWith(
    BsApprovalSignRequest value,
    $Res Function(BsApprovalSignRequest) then,
  ) = _$BsApprovalSignRequestCopyWithImpl<$Res, BsApprovalSignRequest>;
  @useResult
  $Res call({
    BsApprovalAction action,
    String approverUserId,
    BsOperationTarget? operationTarget,
  });
}

/// @nodoc
class _$BsApprovalSignRequestCopyWithImpl<
  $Res,
  $Val extends BsApprovalSignRequest
>
    implements $BsApprovalSignRequestCopyWith<$Res> {
  _$BsApprovalSignRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsApprovalSignRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? approverUserId = null,
    Object? operationTarget = freezed,
  }) {
    return _then(
      _value.copyWith(
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as BsApprovalAction,
            approverUserId: null == approverUserId
                ? _value.approverUserId
                : approverUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            operationTarget: freezed == operationTarget
                ? _value.operationTarget
                : operationTarget // ignore: cast_nullable_to_non_nullable
                      as BsOperationTarget?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BsApprovalSignRequestImplCopyWith<$Res>
    implements $BsApprovalSignRequestCopyWith<$Res> {
  factory _$$BsApprovalSignRequestImplCopyWith(
    _$BsApprovalSignRequestImpl value,
    $Res Function(_$BsApprovalSignRequestImpl) then,
  ) = __$$BsApprovalSignRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BsApprovalAction action,
    String approverUserId,
    BsOperationTarget? operationTarget,
  });
}

/// @nodoc
class __$$BsApprovalSignRequestImplCopyWithImpl<$Res>
    extends
        _$BsApprovalSignRequestCopyWithImpl<$Res, _$BsApprovalSignRequestImpl>
    implements _$$BsApprovalSignRequestImplCopyWith<$Res> {
  __$$BsApprovalSignRequestImplCopyWithImpl(
    _$BsApprovalSignRequestImpl _value,
    $Res Function(_$BsApprovalSignRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsApprovalSignRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? approverUserId = null,
    Object? operationTarget = freezed,
  }) {
    return _then(
      _$BsApprovalSignRequestImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as BsApprovalAction,
        approverUserId: null == approverUserId
            ? _value.approverUserId
            : approverUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationTarget: freezed == operationTarget
            ? _value.operationTarget
            : operationTarget // ignore: cast_nullable_to_non_nullable
                  as BsOperationTarget?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsApprovalSignRequestImpl implements _BsApprovalSignRequest {
  const _$BsApprovalSignRequestImpl({
    required this.action,
    required this.approverUserId,
    this.operationTarget,
  });

  factory _$BsApprovalSignRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsApprovalSignRequestImplFromJson(json);

  @override
  final BsApprovalAction action;
  @override
  final String approverUserId;
  @override
  final BsOperationTarget? operationTarget;

  @override
  String toString() {
    return 'BsApprovalSignRequest(action: $action, approverUserId: $approverUserId, operationTarget: $operationTarget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsApprovalSignRequestImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.approverUserId, approverUserId) ||
                other.approverUserId == approverUserId) &&
            (identical(other.operationTarget, operationTarget) ||
                other.operationTarget == operationTarget));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, action, approverUserId, operationTarget);

  /// Create a copy of BsApprovalSignRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsApprovalSignRequestImplCopyWith<_$BsApprovalSignRequestImpl>
  get copyWith =>
      __$$BsApprovalSignRequestImplCopyWithImpl<_$BsApprovalSignRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BsApprovalSignRequestImplToJson(this);
  }
}

abstract class _BsApprovalSignRequest implements BsApprovalSignRequest {
  const factory _BsApprovalSignRequest({
    required final BsApprovalAction action,
    required final String approverUserId,
    final BsOperationTarget? operationTarget,
  }) = _$BsApprovalSignRequestImpl;

  factory _BsApprovalSignRequest.fromJson(Map<String, dynamic> json) =
      _$BsApprovalSignRequestImpl.fromJson;

  @override
  BsApprovalAction get action;
  @override
  String get approverUserId;
  @override
  BsOperationTarget? get operationTarget;

  /// Create a copy of BsApprovalSignRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsApprovalSignRequestImplCopyWith<_$BsApprovalSignRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BsSignApprovalResponseData _$BsSignApprovalResponseDataFromJson(
  Map<String, dynamic> json,
) {
  return _BsSignApprovalResponseData.fromJson(json);
}

/// @nodoc
mixin _$BsSignApprovalResponseData {
  String? get correlationId => throw _privateConstructorUsedError;
  String get approvalId => throw _privateConstructorUsedError;
  String get operationId => throw _privateConstructorUsedError;
  BsOperationType? get operationType => throw _privateConstructorUsedError;
  BsApprovalStatus get action => throw _privateConstructorUsedError;
  BsOperationStatus get operationStatus => throw _privateConstructorUsedError;
  int get approvalLevel => throw _privateConstructorUsedError;
  String get approvalName => throw _privateConstructorUsedError;
  String? get approvalMail => throw _privateConstructorUsedError;
  String get signedAt => throw _privateConstructorUsedError;
  String? get rejectedAt => throw _privateConstructorUsedError;
  int? get approvalLevelsRequired => throw _privateConstructorUsedError;
  String? get approvedAt => throw _privateConstructorUsedError;

  /// Serializes this BsSignApprovalResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsSignApprovalResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsSignApprovalResponseDataCopyWith<BsSignApprovalResponseData>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsSignApprovalResponseDataCopyWith<$Res> {
  factory $BsSignApprovalResponseDataCopyWith(
    BsSignApprovalResponseData value,
    $Res Function(BsSignApprovalResponseData) then,
  ) =
      _$BsSignApprovalResponseDataCopyWithImpl<
        $Res,
        BsSignApprovalResponseData
      >;
  @useResult
  $Res call({
    String? correlationId,
    String approvalId,
    String operationId,
    BsOperationType? operationType,
    BsApprovalStatus action,
    BsOperationStatus operationStatus,
    int approvalLevel,
    String approvalName,
    String? approvalMail,
    String signedAt,
    String? rejectedAt,
    int? approvalLevelsRequired,
    String? approvedAt,
  });
}

/// @nodoc
class _$BsSignApprovalResponseDataCopyWithImpl<
  $Res,
  $Val extends BsSignApprovalResponseData
>
    implements $BsSignApprovalResponseDataCopyWith<$Res> {
  _$BsSignApprovalResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsSignApprovalResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correlationId = freezed,
    Object? approvalId = null,
    Object? operationId = null,
    Object? operationType = freezed,
    Object? action = null,
    Object? operationStatus = null,
    Object? approvalLevel = null,
    Object? approvalName = null,
    Object? approvalMail = freezed,
    Object? signedAt = null,
    Object? rejectedAt = freezed,
    Object? approvalLevelsRequired = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            correlationId: freezed == correlationId
                ? _value.correlationId
                : correlationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvalId: null == approvalId
                ? _value.approvalId
                : approvalId // ignore: cast_nullable_to_non_nullable
                      as String,
            operationId: null == operationId
                ? _value.operationId
                : operationId // ignore: cast_nullable_to_non_nullable
                      as String,
            operationType: freezed == operationType
                ? _value.operationType
                : operationType // ignore: cast_nullable_to_non_nullable
                      as BsOperationType?,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as BsApprovalStatus,
            operationStatus: null == operationStatus
                ? _value.operationStatus
                : operationStatus // ignore: cast_nullable_to_non_nullable
                      as BsOperationStatus,
            approvalLevel: null == approvalLevel
                ? _value.approvalLevel
                : approvalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            approvalName: null == approvalName
                ? _value.approvalName
                : approvalName // ignore: cast_nullable_to_non_nullable
                      as String,
            approvalMail: freezed == approvalMail
                ? _value.approvalMail
                : approvalMail // ignore: cast_nullable_to_non_nullable
                      as String?,
            signedAt: null == signedAt
                ? _value.signedAt
                : signedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            rejectedAt: freezed == rejectedAt
                ? _value.rejectedAt
                : rejectedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvalLevelsRequired: freezed == approvalLevelsRequired
                ? _value.approvalLevelsRequired
                : approvalLevelsRequired // ignore: cast_nullable_to_non_nullable
                      as int?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BsSignApprovalResponseDataImplCopyWith<$Res>
    implements $BsSignApprovalResponseDataCopyWith<$Res> {
  factory _$$BsSignApprovalResponseDataImplCopyWith(
    _$BsSignApprovalResponseDataImpl value,
    $Res Function(_$BsSignApprovalResponseDataImpl) then,
  ) = __$$BsSignApprovalResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? correlationId,
    String approvalId,
    String operationId,
    BsOperationType? operationType,
    BsApprovalStatus action,
    BsOperationStatus operationStatus,
    int approvalLevel,
    String approvalName,
    String? approvalMail,
    String signedAt,
    String? rejectedAt,
    int? approvalLevelsRequired,
    String? approvedAt,
  });
}

/// @nodoc
class __$$BsSignApprovalResponseDataImplCopyWithImpl<$Res>
    extends
        _$BsSignApprovalResponseDataCopyWithImpl<
          $Res,
          _$BsSignApprovalResponseDataImpl
        >
    implements _$$BsSignApprovalResponseDataImplCopyWith<$Res> {
  __$$BsSignApprovalResponseDataImplCopyWithImpl(
    _$BsSignApprovalResponseDataImpl _value,
    $Res Function(_$BsSignApprovalResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsSignApprovalResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correlationId = freezed,
    Object? approvalId = null,
    Object? operationId = null,
    Object? operationType = freezed,
    Object? action = null,
    Object? operationStatus = null,
    Object? approvalLevel = null,
    Object? approvalName = null,
    Object? approvalMail = freezed,
    Object? signedAt = null,
    Object? rejectedAt = freezed,
    Object? approvalLevelsRequired = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _$BsSignApprovalResponseDataImpl(
        correlationId: freezed == correlationId
            ? _value.correlationId
            : correlationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvalId: null == approvalId
            ? _value.approvalId
            : approvalId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationId: null == operationId
            ? _value.operationId
            : operationId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationType: freezed == operationType
            ? _value.operationType
            : operationType // ignore: cast_nullable_to_non_nullable
                  as BsOperationType?,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as BsApprovalStatus,
        operationStatus: null == operationStatus
            ? _value.operationStatus
            : operationStatus // ignore: cast_nullable_to_non_nullable
                  as BsOperationStatus,
        approvalLevel: null == approvalLevel
            ? _value.approvalLevel
            : approvalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        approvalName: null == approvalName
            ? _value.approvalName
            : approvalName // ignore: cast_nullable_to_non_nullable
                  as String,
        approvalMail: freezed == approvalMail
            ? _value.approvalMail
            : approvalMail // ignore: cast_nullable_to_non_nullable
                  as String?,
        signedAt: null == signedAt
            ? _value.signedAt
            : signedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        rejectedAt: freezed == rejectedAt
            ? _value.rejectedAt
            : rejectedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvalLevelsRequired: freezed == approvalLevelsRequired
            ? _value.approvalLevelsRequired
            : approvalLevelsRequired // ignore: cast_nullable_to_non_nullable
                  as int?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsSignApprovalResponseDataImpl implements _BsSignApprovalResponseData {
  const _$BsSignApprovalResponseDataImpl({
    this.correlationId,
    required this.approvalId,
    required this.operationId,
    this.operationType,
    required this.action,
    required this.operationStatus,
    required this.approvalLevel,
    required this.approvalName,
    this.approvalMail,
    required this.signedAt,
    this.rejectedAt,
    this.approvalLevelsRequired,
    this.approvedAt,
  });

  factory _$BsSignApprovalResponseDataImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$BsSignApprovalResponseDataImplFromJson(json);

  @override
  final String? correlationId;
  @override
  final String approvalId;
  @override
  final String operationId;
  @override
  final BsOperationType? operationType;
  @override
  final BsApprovalStatus action;
  @override
  final BsOperationStatus operationStatus;
  @override
  final int approvalLevel;
  @override
  final String approvalName;
  @override
  final String? approvalMail;
  @override
  final String signedAt;
  @override
  final String? rejectedAt;
  @override
  final int? approvalLevelsRequired;
  @override
  final String? approvedAt;

  @override
  String toString() {
    return 'BsSignApprovalResponseData(correlationId: $correlationId, approvalId: $approvalId, operationId: $operationId, operationType: $operationType, action: $action, operationStatus: $operationStatus, approvalLevel: $approvalLevel, approvalName: $approvalName, approvalMail: $approvalMail, signedAt: $signedAt, rejectedAt: $rejectedAt, approvalLevelsRequired: $approvalLevelsRequired, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsSignApprovalResponseDataImpl &&
            (identical(other.correlationId, correlationId) ||
                other.correlationId == correlationId) &&
            (identical(other.approvalId, approvalId) ||
                other.approvalId == approvalId) &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.operationStatus, operationStatus) ||
                other.operationStatus == operationStatus) &&
            (identical(other.approvalLevel, approvalLevel) ||
                other.approvalLevel == approvalLevel) &&
            (identical(other.approvalName, approvalName) ||
                other.approvalName == approvalName) &&
            (identical(other.approvalMail, approvalMail) ||
                other.approvalMail == approvalMail) &&
            (identical(other.signedAt, signedAt) ||
                other.signedAt == signedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.approvalLevelsRequired, approvalLevelsRequired) ||
                other.approvalLevelsRequired == approvalLevelsRequired) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    correlationId,
    approvalId,
    operationId,
    operationType,
    action,
    operationStatus,
    approvalLevel,
    approvalName,
    approvalMail,
    signedAt,
    rejectedAt,
    approvalLevelsRequired,
    approvedAt,
  );

  /// Create a copy of BsSignApprovalResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsSignApprovalResponseDataImplCopyWith<_$BsSignApprovalResponseDataImpl>
  get copyWith =>
      __$$BsSignApprovalResponseDataImplCopyWithImpl<
        _$BsSignApprovalResponseDataImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsSignApprovalResponseDataImplToJson(this);
  }
}

abstract class _BsSignApprovalResponseData
    implements BsSignApprovalResponseData {
  const factory _BsSignApprovalResponseData({
    final String? correlationId,
    required final String approvalId,
    required final String operationId,
    final BsOperationType? operationType,
    required final BsApprovalStatus action,
    required final BsOperationStatus operationStatus,
    required final int approvalLevel,
    required final String approvalName,
    final String? approvalMail,
    required final String signedAt,
    final String? rejectedAt,
    final int? approvalLevelsRequired,
    final String? approvedAt,
  }) = _$BsSignApprovalResponseDataImpl;

  factory _BsSignApprovalResponseData.fromJson(Map<String, dynamic> json) =
      _$BsSignApprovalResponseDataImpl.fromJson;

  @override
  String? get correlationId;
  @override
  String get approvalId;
  @override
  String get operationId;
  @override
  BsOperationType? get operationType;
  @override
  BsApprovalStatus get action;
  @override
  BsOperationStatus get operationStatus;
  @override
  int get approvalLevel;
  @override
  String get approvalName;
  @override
  String? get approvalMail;
  @override
  String get signedAt;
  @override
  String? get rejectedAt;
  @override
  int? get approvalLevelsRequired;
  @override
  String? get approvedAt;

  /// Create a copy of BsSignApprovalResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsSignApprovalResponseDataImplCopyWith<_$BsSignApprovalResponseDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BsSignApprovalResponse _$BsSignApprovalResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BsSignApprovalResponse.fromJson(json);
}

/// @nodoc
mixin _$BsSignApprovalResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BsSignApprovalResponseData? get data => throw _privateConstructorUsedError;

  /// Serializes this BsSignApprovalResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsSignApprovalResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsSignApprovalResponseCopyWith<BsSignApprovalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsSignApprovalResponseCopyWith<$Res> {
  factory $BsSignApprovalResponseCopyWith(
    BsSignApprovalResponse value,
    $Res Function(BsSignApprovalResponse) then,
  ) = _$BsSignApprovalResponseCopyWithImpl<$Res, BsSignApprovalResponse>;
  @useResult
  $Res call({bool success, String message, BsSignApprovalResponseData? data});

  $BsSignApprovalResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BsSignApprovalResponseCopyWithImpl<
  $Res,
  $Val extends BsSignApprovalResponse
>
    implements $BsSignApprovalResponseCopyWith<$Res> {
  _$BsSignApprovalResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsSignApprovalResponse
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
                      as BsSignApprovalResponseData?,
          )
          as $Val,
    );
  }

  /// Create a copy of BsSignApprovalResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BsSignApprovalResponseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BsSignApprovalResponseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BsSignApprovalResponseImplCopyWith<$Res>
    implements $BsSignApprovalResponseCopyWith<$Res> {
  factory _$$BsSignApprovalResponseImplCopyWith(
    _$BsSignApprovalResponseImpl value,
    $Res Function(_$BsSignApprovalResponseImpl) then,
  ) = __$$BsSignApprovalResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, BsSignApprovalResponseData? data});

  @override
  $BsSignApprovalResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BsSignApprovalResponseImplCopyWithImpl<$Res>
    extends
        _$BsSignApprovalResponseCopyWithImpl<$Res, _$BsSignApprovalResponseImpl>
    implements _$$BsSignApprovalResponseImplCopyWith<$Res> {
  __$$BsSignApprovalResponseImplCopyWithImpl(
    _$BsSignApprovalResponseImpl _value,
    $Res Function(_$BsSignApprovalResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsSignApprovalResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _$BsSignApprovalResponseImpl(
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
                  as BsSignApprovalResponseData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsSignApprovalResponseImpl implements _BsSignApprovalResponse {
  const _$BsSignApprovalResponseImpl({
    required this.success,
    required this.message,
    this.data,
  });

  factory _$BsSignApprovalResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsSignApprovalResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final BsSignApprovalResponseData? data;

  @override
  String toString() {
    return 'BsSignApprovalResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsSignApprovalResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of BsSignApprovalResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsSignApprovalResponseImplCopyWith<_$BsSignApprovalResponseImpl>
  get copyWith =>
      __$$BsSignApprovalResponseImplCopyWithImpl<_$BsSignApprovalResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BsSignApprovalResponseImplToJson(this);
  }
}

abstract class _BsSignApprovalResponse implements BsSignApprovalResponse {
  const factory _BsSignApprovalResponse({
    required final bool success,
    required final String message,
    final BsSignApprovalResponseData? data,
  }) = _$BsSignApprovalResponseImpl;

  factory _BsSignApprovalResponse.fromJson(Map<String, dynamic> json) =
      _$BsSignApprovalResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  BsSignApprovalResponseData? get data;

  /// Create a copy of BsSignApprovalResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsSignApprovalResponseImplCopyWith<_$BsSignApprovalResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
