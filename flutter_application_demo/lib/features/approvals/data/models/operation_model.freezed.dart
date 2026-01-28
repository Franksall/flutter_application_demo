// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BsAccountSummary _$BsAccountSummaryFromJson(Map<String, dynamic> json) {
  return _BsAccountSummary.fromJson(json);
}

/// @nodoc
mixin _$BsAccountSummary {
  String get accountNumber => throw _privateConstructorUsedError;

  /// Serializes this BsAccountSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsAccountSummaryCopyWith<BsAccountSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsAccountSummaryCopyWith<$Res> {
  factory $BsAccountSummaryCopyWith(
    BsAccountSummary value,
    $Res Function(BsAccountSummary) then,
  ) = _$BsAccountSummaryCopyWithImpl<$Res, BsAccountSummary>;
  @useResult
  $Res call({String accountNumber});
}

/// @nodoc
class _$BsAccountSummaryCopyWithImpl<$Res, $Val extends BsAccountSummary>
    implements $BsAccountSummaryCopyWith<$Res> {
  _$BsAccountSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountNumber = null}) {
    return _then(
      _value.copyWith(
            accountNumber: null == accountNumber
                ? _value.accountNumber
                : accountNumber // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BsAccountSummaryImplCopyWith<$Res>
    implements $BsAccountSummaryCopyWith<$Res> {
  factory _$$BsAccountSummaryImplCopyWith(
    _$BsAccountSummaryImpl value,
    $Res Function(_$BsAccountSummaryImpl) then,
  ) = __$$BsAccountSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountNumber});
}

/// @nodoc
class __$$BsAccountSummaryImplCopyWithImpl<$Res>
    extends _$BsAccountSummaryCopyWithImpl<$Res, _$BsAccountSummaryImpl>
    implements _$$BsAccountSummaryImplCopyWith<$Res> {
  __$$BsAccountSummaryImplCopyWithImpl(
    _$BsAccountSummaryImpl _value,
    $Res Function(_$BsAccountSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountNumber = null}) {
    return _then(
      _$BsAccountSummaryImpl(
        accountNumber: null == accountNumber
            ? _value.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsAccountSummaryImpl implements _BsAccountSummary {
  const _$BsAccountSummaryImpl({required this.accountNumber});

  factory _$BsAccountSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsAccountSummaryImplFromJson(json);

  @override
  final String accountNumber;

  @override
  String toString() {
    return 'BsAccountSummary(accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsAccountSummaryImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber);

  /// Create a copy of BsAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsAccountSummaryImplCopyWith<_$BsAccountSummaryImpl> get copyWith =>
      __$$BsAccountSummaryImplCopyWithImpl<_$BsAccountSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BsAccountSummaryImplToJson(this);
  }
}

abstract class _BsAccountSummary implements BsAccountSummary {
  const factory _BsAccountSummary({required final String accountNumber}) =
      _$BsAccountSummaryImpl;

  factory _BsAccountSummary.fromJson(Map<String, dynamic> json) =
      _$BsAccountSummaryImpl.fromJson;

  @override
  String get accountNumber;

  /// Create a copy of BsAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsAccountSummaryImplCopyWith<_$BsAccountSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BsDestinationAccountSummary _$BsDestinationAccountSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _BsDestinationAccountSummary.fromJson(json);
}

/// @nodoc
mixin _$BsDestinationAccountSummary {
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get beneficiaryName => throw _privateConstructorUsedError;

  /// Serializes this BsDestinationAccountSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsDestinationAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsDestinationAccountSummaryCopyWith<BsDestinationAccountSummary>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsDestinationAccountSummaryCopyWith<$Res> {
  factory $BsDestinationAccountSummaryCopyWith(
    BsDestinationAccountSummary value,
    $Res Function(BsDestinationAccountSummary) then,
  ) =
      _$BsDestinationAccountSummaryCopyWithImpl<
        $Res,
        BsDestinationAccountSummary
      >;
  @useResult
  $Res call({String? accountNumber, String? beneficiaryName});
}

/// @nodoc
class _$BsDestinationAccountSummaryCopyWithImpl<
  $Res,
  $Val extends BsDestinationAccountSummary
>
    implements $BsDestinationAccountSummaryCopyWith<$Res> {
  _$BsDestinationAccountSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsDestinationAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = freezed,
    Object? beneficiaryName = freezed,
  }) {
    return _then(
      _value.copyWith(
            accountNumber: freezed == accountNumber
                ? _value.accountNumber
                : accountNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            beneficiaryName: freezed == beneficiaryName
                ? _value.beneficiaryName
                : beneficiaryName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BsDestinationAccountSummaryImplCopyWith<$Res>
    implements $BsDestinationAccountSummaryCopyWith<$Res> {
  factory _$$BsDestinationAccountSummaryImplCopyWith(
    _$BsDestinationAccountSummaryImpl value,
    $Res Function(_$BsDestinationAccountSummaryImpl) then,
  ) = __$$BsDestinationAccountSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accountNumber, String? beneficiaryName});
}

/// @nodoc
class __$$BsDestinationAccountSummaryImplCopyWithImpl<$Res>
    extends
        _$BsDestinationAccountSummaryCopyWithImpl<
          $Res,
          _$BsDestinationAccountSummaryImpl
        >
    implements _$$BsDestinationAccountSummaryImplCopyWith<$Res> {
  __$$BsDestinationAccountSummaryImplCopyWithImpl(
    _$BsDestinationAccountSummaryImpl _value,
    $Res Function(_$BsDestinationAccountSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsDestinationAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = freezed,
    Object? beneficiaryName = freezed,
  }) {
    return _then(
      _$BsDestinationAccountSummaryImpl(
        accountNumber: freezed == accountNumber
            ? _value.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        beneficiaryName: freezed == beneficiaryName
            ? _value.beneficiaryName
            : beneficiaryName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsDestinationAccountSummaryImpl
    implements _BsDestinationAccountSummary {
  const _$BsDestinationAccountSummaryImpl({
    this.accountNumber,
    this.beneficiaryName,
  });

  factory _$BsDestinationAccountSummaryImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$BsDestinationAccountSummaryImplFromJson(json);

  @override
  final String? accountNumber;
  @override
  final String? beneficiaryName;

  @override
  String toString() {
    return 'BsDestinationAccountSummary(accountNumber: $accountNumber, beneficiaryName: $beneficiaryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsDestinationAccountSummaryImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.beneficiaryName, beneficiaryName) ||
                other.beneficiaryName == beneficiaryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber, beneficiaryName);

  /// Create a copy of BsDestinationAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsDestinationAccountSummaryImplCopyWith<_$BsDestinationAccountSummaryImpl>
  get copyWith =>
      __$$BsDestinationAccountSummaryImplCopyWithImpl<
        _$BsDestinationAccountSummaryImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsDestinationAccountSummaryImplToJson(this);
  }
}

abstract class _BsDestinationAccountSummary
    implements BsDestinationAccountSummary {
  const factory _BsDestinationAccountSummary({
    final String? accountNumber,
    final String? beneficiaryName,
  }) = _$BsDestinationAccountSummaryImpl;

  factory _BsDestinationAccountSummary.fromJson(Map<String, dynamic> json) =
      _$BsDestinationAccountSummaryImpl.fromJson;

  @override
  String? get accountNumber;
  @override
  String? get beneficiaryName;

  /// Create a copy of BsDestinationAccountSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsDestinationAccountSummaryImplCopyWith<_$BsDestinationAccountSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BsOperationSummary _$BsOperationSummaryFromJson(Map<String, dynamic> json) {
  return _BsOperationSummary.fromJson(json);
}

/// @nodoc
mixin _$BsOperationSummary {
  String get operationId => throw _privateConstructorUsedError;
  String get operationName => throw _privateConstructorUsedError;
  String get operationDate => throw _privateConstructorUsedError;
  BsOperationType get operationType => throw _privateConstructorUsedError;
  BsOperationStatus get status => throw _privateConstructorUsedError;
  BsCurrencyType? get currency => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  double? get commision => throw _privateConstructorUsedError;
  BsAccountSummary? get sourceAccount => throw _privateConstructorUsedError;
  BsDestinationAccountSummary? get destinationAccount =>
      throw _privateConstructorUsedError;
  int get approvalLevelsRequired => throw _privateConstructorUsedError;
  int get currentApprovalLevel => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BsOperationSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsOperationSummaryCopyWith<BsOperationSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsOperationSummaryCopyWith<$Res> {
  factory $BsOperationSummaryCopyWith(
    BsOperationSummary value,
    $Res Function(BsOperationSummary) then,
  ) = _$BsOperationSummaryCopyWithImpl<$Res, BsOperationSummary>;
  @useResult
  $Res call({
    String operationId,
    String operationName,
    String operationDate,
    BsOperationType operationType,
    BsOperationStatus status,
    BsCurrencyType? currency,
    double? amount,
    double? commision,
    BsAccountSummary? sourceAccount,
    BsDestinationAccountSummary? destinationAccount,
    int approvalLevelsRequired,
    int currentApprovalLevel,
    String createdAt,
  });

  $BsAccountSummaryCopyWith<$Res>? get sourceAccount;
  $BsDestinationAccountSummaryCopyWith<$Res>? get destinationAccount;
}

/// @nodoc
class _$BsOperationSummaryCopyWithImpl<$Res, $Val extends BsOperationSummary>
    implements $BsOperationSummaryCopyWith<$Res> {
  _$BsOperationSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? operationName = null,
    Object? operationDate = null,
    Object? operationType = null,
    Object? status = null,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? commision = freezed,
    Object? sourceAccount = freezed,
    Object? destinationAccount = freezed,
    Object? approvalLevelsRequired = null,
    Object? currentApprovalLevel = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            operationId: null == operationId
                ? _value.operationId
                : operationId // ignore: cast_nullable_to_non_nullable
                      as String,
            operationName: null == operationName
                ? _value.operationName
                : operationName // ignore: cast_nullable_to_non_nullable
                      as String,
            operationDate: null == operationDate
                ? _value.operationDate
                : operationDate // ignore: cast_nullable_to_non_nullable
                      as String,
            operationType: null == operationType
                ? _value.operationType
                : operationType // ignore: cast_nullable_to_non_nullable
                      as BsOperationType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BsOperationStatus,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as BsCurrencyType?,
            amount: freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double?,
            commision: freezed == commision
                ? _value.commision
                : commision // ignore: cast_nullable_to_non_nullable
                      as double?,
            sourceAccount: freezed == sourceAccount
                ? _value.sourceAccount
                : sourceAccount // ignore: cast_nullable_to_non_nullable
                      as BsAccountSummary?,
            destinationAccount: freezed == destinationAccount
                ? _value.destinationAccount
                : destinationAccount // ignore: cast_nullable_to_non_nullable
                      as BsDestinationAccountSummary?,
            approvalLevelsRequired: null == approvalLevelsRequired
                ? _value.approvalLevelsRequired
                : approvalLevelsRequired // ignore: cast_nullable_to_non_nullable
                      as int,
            currentApprovalLevel: null == currentApprovalLevel
                ? _value.currentApprovalLevel
                : currentApprovalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BsAccountSummaryCopyWith<$Res>? get sourceAccount {
    if (_value.sourceAccount == null) {
      return null;
    }

    return $BsAccountSummaryCopyWith<$Res>(_value.sourceAccount!, (value) {
      return _then(_value.copyWith(sourceAccount: value) as $Val);
    });
  }

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BsDestinationAccountSummaryCopyWith<$Res>? get destinationAccount {
    if (_value.destinationAccount == null) {
      return null;
    }

    return $BsDestinationAccountSummaryCopyWith<$Res>(
      _value.destinationAccount!,
      (value) {
        return _then(_value.copyWith(destinationAccount: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$BsOperationSummaryImplCopyWith<$Res>
    implements $BsOperationSummaryCopyWith<$Res> {
  factory _$$BsOperationSummaryImplCopyWith(
    _$BsOperationSummaryImpl value,
    $Res Function(_$BsOperationSummaryImpl) then,
  ) = __$$BsOperationSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String operationId,
    String operationName,
    String operationDate,
    BsOperationType operationType,
    BsOperationStatus status,
    BsCurrencyType? currency,
    double? amount,
    double? commision,
    BsAccountSummary? sourceAccount,
    BsDestinationAccountSummary? destinationAccount,
    int approvalLevelsRequired,
    int currentApprovalLevel,
    String createdAt,
  });

  @override
  $BsAccountSummaryCopyWith<$Res>? get sourceAccount;
  @override
  $BsDestinationAccountSummaryCopyWith<$Res>? get destinationAccount;
}

/// @nodoc
class __$$BsOperationSummaryImplCopyWithImpl<$Res>
    extends _$BsOperationSummaryCopyWithImpl<$Res, _$BsOperationSummaryImpl>
    implements _$$BsOperationSummaryImplCopyWith<$Res> {
  __$$BsOperationSummaryImplCopyWithImpl(
    _$BsOperationSummaryImpl _value,
    $Res Function(_$BsOperationSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? operationName = null,
    Object? operationDate = null,
    Object? operationType = null,
    Object? status = null,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? commision = freezed,
    Object? sourceAccount = freezed,
    Object? destinationAccount = freezed,
    Object? approvalLevelsRequired = null,
    Object? currentApprovalLevel = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$BsOperationSummaryImpl(
        operationId: null == operationId
            ? _value.operationId
            : operationId // ignore: cast_nullable_to_non_nullable
                  as String,
        operationName: null == operationName
            ? _value.operationName
            : operationName // ignore: cast_nullable_to_non_nullable
                  as String,
        operationDate: null == operationDate
            ? _value.operationDate
            : operationDate // ignore: cast_nullable_to_non_nullable
                  as String,
        operationType: null == operationType
            ? _value.operationType
            : operationType // ignore: cast_nullable_to_non_nullable
                  as BsOperationType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BsOperationStatus,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as BsCurrencyType?,
        amount: freezed == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double?,
        commision: freezed == commision
            ? _value.commision
            : commision // ignore: cast_nullable_to_non_nullable
                  as double?,
        sourceAccount: freezed == sourceAccount
            ? _value.sourceAccount
            : sourceAccount // ignore: cast_nullable_to_non_nullable
                  as BsAccountSummary?,
        destinationAccount: freezed == destinationAccount
            ? _value.destinationAccount
            : destinationAccount // ignore: cast_nullable_to_non_nullable
                  as BsDestinationAccountSummary?,
        approvalLevelsRequired: null == approvalLevelsRequired
            ? _value.approvalLevelsRequired
            : approvalLevelsRequired // ignore: cast_nullable_to_non_nullable
                  as int,
        currentApprovalLevel: null == currentApprovalLevel
            ? _value.currentApprovalLevel
            : currentApprovalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsOperationSummaryImpl implements _BsOperationSummary {
  const _$BsOperationSummaryImpl({
    required this.operationId,
    required this.operationName,
    required this.operationDate,
    required this.operationType,
    required this.status,
    this.currency,
    this.amount,
    this.commision,
    this.sourceAccount,
    this.destinationAccount,
    required this.approvalLevelsRequired,
    required this.currentApprovalLevel,
    required this.createdAt,
  });

  factory _$BsOperationSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsOperationSummaryImplFromJson(json);

  @override
  final String operationId;
  @override
  final String operationName;
  @override
  final String operationDate;
  @override
  final BsOperationType operationType;
  @override
  final BsOperationStatus status;
  @override
  final BsCurrencyType? currency;
  @override
  final double? amount;
  @override
  final double? commision;
  @override
  final BsAccountSummary? sourceAccount;
  @override
  final BsDestinationAccountSummary? destinationAccount;
  @override
  final int approvalLevelsRequired;
  @override
  final int currentApprovalLevel;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'BsOperationSummary(operationId: $operationId, operationName: $operationName, operationDate: $operationDate, operationType: $operationType, status: $status, currency: $currency, amount: $amount, commision: $commision, sourceAccount: $sourceAccount, destinationAccount: $destinationAccount, approvalLevelsRequired: $approvalLevelsRequired, currentApprovalLevel: $currentApprovalLevel, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsOperationSummaryImpl &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.operationName, operationName) ||
                other.operationName == operationName) &&
            (identical(other.operationDate, operationDate) ||
                other.operationDate == operationDate) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.commision, commision) ||
                other.commision == commision) &&
            (identical(other.sourceAccount, sourceAccount) ||
                other.sourceAccount == sourceAccount) &&
            (identical(other.destinationAccount, destinationAccount) ||
                other.destinationAccount == destinationAccount) &&
            (identical(other.approvalLevelsRequired, approvalLevelsRequired) ||
                other.approvalLevelsRequired == approvalLevelsRequired) &&
            (identical(other.currentApprovalLevel, currentApprovalLevel) ||
                other.currentApprovalLevel == currentApprovalLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    operationId,
    operationName,
    operationDate,
    operationType,
    status,
    currency,
    amount,
    commision,
    sourceAccount,
    destinationAccount,
    approvalLevelsRequired,
    currentApprovalLevel,
    createdAt,
  );

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsOperationSummaryImplCopyWith<_$BsOperationSummaryImpl> get copyWith =>
      __$$BsOperationSummaryImplCopyWithImpl<_$BsOperationSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BsOperationSummaryImplToJson(this);
  }
}

abstract class _BsOperationSummary implements BsOperationSummary {
  const factory _BsOperationSummary({
    required final String operationId,
    required final String operationName,
    required final String operationDate,
    required final BsOperationType operationType,
    required final BsOperationStatus status,
    final BsCurrencyType? currency,
    final double? amount,
    final double? commision,
    final BsAccountSummary? sourceAccount,
    final BsDestinationAccountSummary? destinationAccount,
    required final int approvalLevelsRequired,
    required final int currentApprovalLevel,
    required final String createdAt,
  }) = _$BsOperationSummaryImpl;

  factory _BsOperationSummary.fromJson(Map<String, dynamic> json) =
      _$BsOperationSummaryImpl.fromJson;

  @override
  String get operationId;
  @override
  String get operationName;
  @override
  String get operationDate;
  @override
  BsOperationType get operationType;
  @override
  BsOperationStatus get status;
  @override
  BsCurrencyType? get currency;
  @override
  double? get amount;
  @override
  double? get commision;
  @override
  BsAccountSummary? get sourceAccount;
  @override
  BsDestinationAccountSummary? get destinationAccount;
  @override
  int get approvalLevelsRequired;
  @override
  int get currentApprovalLevel;
  @override
  String get createdAt;

  /// Create a copy of BsOperationSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsOperationSummaryImplCopyWith<_$BsOperationSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
