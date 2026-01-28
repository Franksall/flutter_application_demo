// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approval_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BsApproval _$BsApprovalFromJson(Map<String, dynamic> json) {
  return _BsApproval.fromJson(json);
}

/// @nodoc
mixin _$BsApproval {
  String get approvalId => throw _privateConstructorUsedError;
  String get operationId => throw _privateConstructorUsedError;
  String get approverUserId => throw _privateConstructorUsedError;
  String get approvalName => throw _privateConstructorUsedError;
  int get approvalLevel => throw _privateConstructorUsedError;
  BsApprovalStatus get status => throw _privateConstructorUsedError;
  BsApprovalAction? get action => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;
  bool? get passwordVerified => throw _privateConstructorUsedError;
  bool? get otpVerified => throw _privateConstructorUsedError;
  String? get signedAt => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this BsApproval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsApprovalCopyWith<BsApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsApprovalCopyWith<$Res> {
  factory $BsApprovalCopyWith(
    BsApproval value,
    $Res Function(BsApproval) then,
  ) = _$BsApprovalCopyWithImpl<$Res, BsApproval>;
  @useResult
  $Res call({
    String approvalId,
    String operationId,
    String approverUserId,
    String approvalName,
    int approvalLevel,
    BsApprovalStatus status,
    BsApprovalAction? action,
    String? rejectionReason,
    bool? passwordVerified,
    bool? otpVerified,
    String? signedAt,
    String? expiresAt,
  });
}

/// @nodoc
class _$BsApprovalCopyWithImpl<$Res, $Val extends BsApproval>
    implements $BsApprovalCopyWith<$Res> {
  _$BsApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsApproval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvalId = null,
    Object? operationId = null,
    Object? approverUserId = null,
    Object? approvalName = null,
    Object? approvalLevel = null,
    Object? status = null,
    Object? action = freezed,
    Object? rejectionReason = freezed,
    Object? passwordVerified = freezed,
    Object? otpVerified = freezed,
    Object? signedAt = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            approvalId: null == approvalId
                ? _value.approvalId
                : approvalId // ignore: cast_nullable_to_non_nullable
                      as String,
            operationId: null == operationId
                ? _value.operationId
                : operationId // ignore: cast_nullable_to_non_nullable
                      as String,
            approverUserId: null == approverUserId
                ? _value.approverUserId
                : approverUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            approvalName: null == approvalName
                ? _value.approvalName
                : approvalName // ignore: cast_nullable_to_non_nullable
                      as String,
            approvalLevel: null == approvalLevel
                ? _value.approvalLevel
                : approvalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BsApprovalStatus,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as BsApprovalAction?,
            rejectionReason: freezed == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            passwordVerified: freezed == passwordVerified
                ? _value.passwordVerified
                : passwordVerified // ignore: cast_nullable_to_non_nullable
                      as bool?,
            otpVerified: freezed == otpVerified
                ? _value.otpVerified
                : otpVerified // ignore: cast_nullable_to_non_nullable
                      as bool?,
            signedAt: freezed == signedAt
                ? _value.signedAt
                : signedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BsApprovalImplCopyWith<$Res>
    implements $BsApprovalCopyWith<$Res> {
  factory _$$BsApprovalImplCopyWith(
    _$BsApprovalImpl value,
    $Res Function(_$BsApprovalImpl) then,
  ) = __$$BsApprovalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String approvalId,
    String operationId,
    String approverUserId,
    String approvalName,
    int approvalLevel,
    BsApprovalStatus status,
    BsApprovalAction? action,
    String? rejectionReason,
    bool? passwordVerified,
    bool? otpVerified,
    String? signedAt,
    String? expiresAt,
  });
}

/// @nodoc
class __$$BsApprovalImplCopyWithImpl<$Res>
    extends _$BsApprovalCopyWithImpl<$Res, _$BsApprovalImpl>
    implements _$$BsApprovalImplCopyWith<$Res> {
  __$$BsApprovalImplCopyWithImpl(
    _$BsApprovalImpl _value,
    $Res Function(_$BsApprovalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsApproval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvalId = null,
    Object? operationId = null,
    Object? approverUserId = null,
    Object? approvalName = null,
    Object? approvalLevel = null,
    Object? status = null,
    Object? action = freezed,
    Object? rejectionReason = freezed,
    Object? passwordVerified = freezed,
    Object? otpVerified = freezed,
    Object? signedAt = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$BsApprovalImpl(
        approvalId: null == approvalId
            ? _value.approvalId
            : approvalId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationId: null == operationId
            ? _value.operationId
            : operationId // ignore: cast_nullable_to_non_nullable
                  as String,
        approverUserId: null == approverUserId
            ? _value.approverUserId
            : approverUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        approvalName: null == approvalName
            ? _value.approvalName
            : approvalName // ignore: cast_nullable_to_non_nullable
                  as String,
        approvalLevel: null == approvalLevel
            ? _value.approvalLevel
            : approvalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BsApprovalStatus,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as BsApprovalAction?,
        rejectionReason: freezed == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        passwordVerified: freezed == passwordVerified
            ? _value.passwordVerified
            : passwordVerified // ignore: cast_nullable_to_non_nullable
                  as bool?,
        otpVerified: freezed == otpVerified
            ? _value.otpVerified
            : otpVerified // ignore: cast_nullable_to_non_nullable
                  as bool?,
        signedAt: freezed == signedAt
            ? _value.signedAt
            : signedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsApprovalImpl implements _BsApproval {
  const _$BsApprovalImpl({
    required this.approvalId,
    required this.operationId,
    required this.approverUserId,
    required this.approvalName,
    required this.approvalLevel,
    required this.status,
    this.action,
    this.rejectionReason,
    this.passwordVerified,
    this.otpVerified,
    this.signedAt,
    this.expiresAt,
  });

  factory _$BsApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsApprovalImplFromJson(json);

  @override
  final String approvalId;
  @override
  final String operationId;
  @override
  final String approverUserId;
  @override
  final String approvalName;
  @override
  final int approvalLevel;
  @override
  final BsApprovalStatus status;
  @override
  final BsApprovalAction? action;
  @override
  final String? rejectionReason;
  @override
  final bool? passwordVerified;
  @override
  final bool? otpVerified;
  @override
  final String? signedAt;
  @override
  final String? expiresAt;

  @override
  String toString() {
    return 'BsApproval(approvalId: $approvalId, operationId: $operationId, approverUserId: $approverUserId, approvalName: $approvalName, approvalLevel: $approvalLevel, status: $status, action: $action, rejectionReason: $rejectionReason, passwordVerified: $passwordVerified, otpVerified: $otpVerified, signedAt: $signedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsApprovalImpl &&
            (identical(other.approvalId, approvalId) ||
                other.approvalId == approvalId) &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.approverUserId, approverUserId) ||
                other.approverUserId == approverUserId) &&
            (identical(other.approvalName, approvalName) ||
                other.approvalName == approvalName) &&
            (identical(other.approvalLevel, approvalLevel) ||
                other.approvalLevel == approvalLevel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.passwordVerified, passwordVerified) ||
                other.passwordVerified == passwordVerified) &&
            (identical(other.otpVerified, otpVerified) ||
                other.otpVerified == otpVerified) &&
            (identical(other.signedAt, signedAt) ||
                other.signedAt == signedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    approvalId,
    operationId,
    approverUserId,
    approvalName,
    approvalLevel,
    status,
    action,
    rejectionReason,
    passwordVerified,
    otpVerified,
    signedAt,
    expiresAt,
  );

  /// Create a copy of BsApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsApprovalImplCopyWith<_$BsApprovalImpl> get copyWith =>
      __$$BsApprovalImplCopyWithImpl<_$BsApprovalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsApprovalImplToJson(this);
  }
}

abstract class _BsApproval implements BsApproval {
  const factory _BsApproval({
    required final String approvalId,
    required final String operationId,
    required final String approverUserId,
    required final String approvalName,
    required final int approvalLevel,
    required final BsApprovalStatus status,
    final BsApprovalAction? action,
    final String? rejectionReason,
    final bool? passwordVerified,
    final bool? otpVerified,
    final String? signedAt,
    final String? expiresAt,
  }) = _$BsApprovalImpl;

  factory _BsApproval.fromJson(Map<String, dynamic> json) =
      _$BsApprovalImpl.fromJson;

  @override
  String get approvalId;
  @override
  String get operationId;
  @override
  String get approverUserId;
  @override
  String get approvalName;
  @override
  int get approvalLevel;
  @override
  BsApprovalStatus get status;
  @override
  BsApprovalAction? get action;
  @override
  String? get rejectionReason;
  @override
  bool? get passwordVerified;
  @override
  bool? get otpVerified;
  @override
  String? get signedAt;
  @override
  String? get expiresAt;

  /// Create a copy of BsApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsApprovalImplCopyWith<_$BsApprovalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
