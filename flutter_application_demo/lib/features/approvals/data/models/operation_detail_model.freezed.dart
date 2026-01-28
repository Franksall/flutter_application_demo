// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BsOperation _$BsOperationFromJson(Map<String, dynamic> json) {
  return _BsOperation.fromJson(json);
}

/// @nodoc
mixin _$BsOperation {
  String get operationId => throw _privateConstructorUsedError;
  String get operationName => throw _privateConstructorUsedError;
  String get operationDate => throw _privateConstructorUsedError;
  BsOperationStatus get status => throw _privateConstructorUsedError;
  String get sourceAccountNumber => throw _privateConstructorUsedError;
  BsAccountType get sourceAccountType => throw _privateConstructorUsedError;
  String? get beneficiaryName => throw _privateConstructorUsedError;
  BsTransferType get transferType => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  BsCurrencyType get currency => throw _privateConstructorUsedError;
  String? get destinationAccountNumber => throw _privateConstructorUsedError;
  int get approvalLevelsRequired => throw _privateConstructorUsedError;
  int get currentApprovalLevel => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;
  String? get approvedAt => throw _privateConstructorUsedError;
  String? get rejectedAt => throw _privateConstructorUsedError;
  List<BsApproval>? get approvals => throw _privateConstructorUsedError;

  /// Serializes this BsOperation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsOperation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsOperationCopyWith<BsOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsOperationCopyWith<$Res> {
  factory $BsOperationCopyWith(
    BsOperation value,
    $Res Function(BsOperation) then,
  ) = _$BsOperationCopyWithImpl<$Res, BsOperation>;
  @useResult
  $Res call({
    String operationId,
    String operationName,
    String operationDate,
    BsOperationStatus status,
    String sourceAccountNumber,
    BsAccountType sourceAccountType,
    String? beneficiaryName,
    BsTransferType transferType,
    double amount,
    BsCurrencyType currency,
    String? destinationAccountNumber,
    int approvalLevelsRequired,
    int currentApprovalLevel,
    String? expiresAt,
    String? approvedAt,
    String? rejectedAt,
    List<BsApproval>? approvals,
  });
}

/// @nodoc
class _$BsOperationCopyWithImpl<$Res, $Val extends BsOperation>
    implements $BsOperationCopyWith<$Res> {
  _$BsOperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsOperation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? operationName = null,
    Object? operationDate = null,
    Object? status = null,
    Object? sourceAccountNumber = null,
    Object? sourceAccountType = null,
    Object? beneficiaryName = freezed,
    Object? transferType = null,
    Object? amount = null,
    Object? currency = null,
    Object? destinationAccountNumber = freezed,
    Object? approvalLevelsRequired = null,
    Object? currentApprovalLevel = null,
    Object? expiresAt = freezed,
    Object? approvedAt = freezed,
    Object? rejectedAt = freezed,
    Object? approvals = freezed,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BsOperationStatus,
            sourceAccountNumber: null == sourceAccountNumber
                ? _value.sourceAccountNumber
                : sourceAccountNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceAccountType: null == sourceAccountType
                ? _value.sourceAccountType
                : sourceAccountType // ignore: cast_nullable_to_non_nullable
                      as BsAccountType,
            beneficiaryName: freezed == beneficiaryName
                ? _value.beneficiaryName
                : beneficiaryName // ignore: cast_nullable_to_non_nullable
                      as String?,
            transferType: null == transferType
                ? _value.transferType
                : transferType // ignore: cast_nullable_to_non_nullable
                      as BsTransferType,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as BsCurrencyType,
            destinationAccountNumber: freezed == destinationAccountNumber
                ? _value.destinationAccountNumber
                : destinationAccountNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvalLevelsRequired: null == approvalLevelsRequired
                ? _value.approvalLevelsRequired
                : approvalLevelsRequired // ignore: cast_nullable_to_non_nullable
                      as int,
            currentApprovalLevel: null == currentApprovalLevel
                ? _value.currentApprovalLevel
                : currentApprovalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejectedAt: freezed == rejectedAt
                ? _value.rejectedAt
                : rejectedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvals: freezed == approvals
                ? _value.approvals
                : approvals // ignore: cast_nullable_to_non_nullable
                      as List<BsApproval>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BsOperationImplCopyWith<$Res>
    implements $BsOperationCopyWith<$Res> {
  factory _$$BsOperationImplCopyWith(
    _$BsOperationImpl value,
    $Res Function(_$BsOperationImpl) then,
  ) = __$$BsOperationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String operationId,
    String operationName,
    String operationDate,
    BsOperationStatus status,
    String sourceAccountNumber,
    BsAccountType sourceAccountType,
    String? beneficiaryName,
    BsTransferType transferType,
    double amount,
    BsCurrencyType currency,
    String? destinationAccountNumber,
    int approvalLevelsRequired,
    int currentApprovalLevel,
    String? expiresAt,
    String? approvedAt,
    String? rejectedAt,
    List<BsApproval>? approvals,
  });
}

/// @nodoc
class __$$BsOperationImplCopyWithImpl<$Res>
    extends _$BsOperationCopyWithImpl<$Res, _$BsOperationImpl>
    implements _$$BsOperationImplCopyWith<$Res> {
  __$$BsOperationImplCopyWithImpl(
    _$BsOperationImpl _value,
    $Res Function(_$BsOperationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsOperation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? operationName = null,
    Object? operationDate = null,
    Object? status = null,
    Object? sourceAccountNumber = null,
    Object? sourceAccountType = null,
    Object? beneficiaryName = freezed,
    Object? transferType = null,
    Object? amount = null,
    Object? currency = null,
    Object? destinationAccountNumber = freezed,
    Object? approvalLevelsRequired = null,
    Object? currentApprovalLevel = null,
    Object? expiresAt = freezed,
    Object? approvedAt = freezed,
    Object? rejectedAt = freezed,
    Object? approvals = freezed,
  }) {
    return _then(
      _$BsOperationImpl(
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BsOperationStatus,
        sourceAccountNumber: null == sourceAccountNumber
            ? _value.sourceAccountNumber
            : sourceAccountNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceAccountType: null == sourceAccountType
            ? _value.sourceAccountType
            : sourceAccountType // ignore: cast_nullable_to_non_nullable
                  as BsAccountType,
        beneficiaryName: freezed == beneficiaryName
            ? _value.beneficiaryName
            : beneficiaryName // ignore: cast_nullable_to_non_nullable
                  as String?,
        transferType: null == transferType
            ? _value.transferType
            : transferType // ignore: cast_nullable_to_non_nullable
                  as BsTransferType,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as BsCurrencyType,
        destinationAccountNumber: freezed == destinationAccountNumber
            ? _value.destinationAccountNumber
            : destinationAccountNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvalLevelsRequired: null == approvalLevelsRequired
            ? _value.approvalLevelsRequired
            : approvalLevelsRequired // ignore: cast_nullable_to_non_nullable
                  as int,
        currentApprovalLevel: null == currentApprovalLevel
            ? _value.currentApprovalLevel
            : currentApprovalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejectedAt: freezed == rejectedAt
            ? _value.rejectedAt
            : rejectedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvals: freezed == approvals
            ? _value._approvals
            : approvals // ignore: cast_nullable_to_non_nullable
                  as List<BsApproval>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsOperationImpl implements _BsOperation {
  const _$BsOperationImpl({
    required this.operationId,
    required this.operationName,
    required this.operationDate,
    required this.status,
    required this.sourceAccountNumber,
    required this.sourceAccountType,
    this.beneficiaryName,
    required this.transferType,
    required this.amount,
    required this.currency,
    this.destinationAccountNumber,
    required this.approvalLevelsRequired,
    required this.currentApprovalLevel,
    this.expiresAt,
    this.approvedAt,
    this.rejectedAt,
    final List<BsApproval>? approvals,
  }) : _approvals = approvals;

  factory _$BsOperationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BsOperationImplFromJson(json);

  @override
  final String operationId;
  @override
  final String operationName;
  @override
  final String operationDate;
  @override
  final BsOperationStatus status;
  @override
  final String sourceAccountNumber;
  @override
  final BsAccountType sourceAccountType;
  @override
  final String? beneficiaryName;
  @override
  final BsTransferType transferType;
  @override
  final double amount;
  @override
  final BsCurrencyType currency;
  @override
  final String? destinationAccountNumber;
  @override
  final int approvalLevelsRequired;
  @override
  final int currentApprovalLevel;
  @override
  final String? expiresAt;
  @override
  final String? approvedAt;
  @override
  final String? rejectedAt;
  final List<BsApproval>? _approvals;
  @override
  List<BsApproval>? get approvals {
    final value = _approvals;
    if (value == null) return null;
    if (_approvals is EqualUnmodifiableListView) return _approvals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BsOperation(operationId: $operationId, operationName: $operationName, operationDate: $operationDate, status: $status, sourceAccountNumber: $sourceAccountNumber, sourceAccountType: $sourceAccountType, beneficiaryName: $beneficiaryName, transferType: $transferType, amount: $amount, currency: $currency, destinationAccountNumber: $destinationAccountNumber, approvalLevelsRequired: $approvalLevelsRequired, currentApprovalLevel: $currentApprovalLevel, expiresAt: $expiresAt, approvedAt: $approvedAt, rejectedAt: $rejectedAt, approvals: $approvals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsOperationImpl &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.operationName, operationName) ||
                other.operationName == operationName) &&
            (identical(other.operationDate, operationDate) ||
                other.operationDate == operationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sourceAccountNumber, sourceAccountNumber) ||
                other.sourceAccountNumber == sourceAccountNumber) &&
            (identical(other.sourceAccountType, sourceAccountType) ||
                other.sourceAccountType == sourceAccountType) &&
            (identical(other.beneficiaryName, beneficiaryName) ||
                other.beneficiaryName == beneficiaryName) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(
                  other.destinationAccountNumber,
                  destinationAccountNumber,
                ) ||
                other.destinationAccountNumber == destinationAccountNumber) &&
            (identical(other.approvalLevelsRequired, approvalLevelsRequired) ||
                other.approvalLevelsRequired == approvalLevelsRequired) &&
            (identical(other.currentApprovalLevel, currentApprovalLevel) ||
                other.currentApprovalLevel == currentApprovalLevel) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            const DeepCollectionEquality().equals(
              other._approvals,
              _approvals,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    operationId,
    operationName,
    operationDate,
    status,
    sourceAccountNumber,
    sourceAccountType,
    beneficiaryName,
    transferType,
    amount,
    currency,
    destinationAccountNumber,
    approvalLevelsRequired,
    currentApprovalLevel,
    expiresAt,
    approvedAt,
    rejectedAt,
    const DeepCollectionEquality().hash(_approvals),
  );

  /// Create a copy of BsOperation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsOperationImplCopyWith<_$BsOperationImpl> get copyWith =>
      __$$BsOperationImplCopyWithImpl<_$BsOperationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsOperationImplToJson(this);
  }
}

abstract class _BsOperation implements BsOperation {
  const factory _BsOperation({
    required final String operationId,
    required final String operationName,
    required final String operationDate,
    required final BsOperationStatus status,
    required final String sourceAccountNumber,
    required final BsAccountType sourceAccountType,
    final String? beneficiaryName,
    required final BsTransferType transferType,
    required final double amount,
    required final BsCurrencyType currency,
    final String? destinationAccountNumber,
    required final int approvalLevelsRequired,
    required final int currentApprovalLevel,
    final String? expiresAt,
    final String? approvedAt,
    final String? rejectedAt,
    final List<BsApproval>? approvals,
  }) = _$BsOperationImpl;

  factory _BsOperation.fromJson(Map<String, dynamic> json) =
      _$BsOperationImpl.fromJson;

  @override
  String get operationId;
  @override
  String get operationName;
  @override
  String get operationDate;
  @override
  BsOperationStatus get status;
  @override
  String get sourceAccountNumber;
  @override
  BsAccountType get sourceAccountType;
  @override
  String? get beneficiaryName;
  @override
  BsTransferType get transferType;
  @override
  double get amount;
  @override
  BsCurrencyType get currency;
  @override
  String? get destinationAccountNumber;
  @override
  int get approvalLevelsRequired;
  @override
  int get currentApprovalLevel;
  @override
  String? get expiresAt;
  @override
  String? get approvedAt;
  @override
  String? get rejectedAt;
  @override
  List<BsApproval>? get approvals;

  /// Create a copy of BsOperation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsOperationImplCopyWith<_$BsOperationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BsGetOperationDetailResponse _$BsGetOperationDetailResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BsGetOperationDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$BsGetOperationDetailResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BsOperation? get data => throw _privateConstructorUsedError;

  /// Serializes this BsGetOperationDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BsGetOperationDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BsGetOperationDetailResponseCopyWith<BsGetOperationDetailResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BsGetOperationDetailResponseCopyWith<$Res> {
  factory $BsGetOperationDetailResponseCopyWith(
    BsGetOperationDetailResponse value,
    $Res Function(BsGetOperationDetailResponse) then,
  ) =
      _$BsGetOperationDetailResponseCopyWithImpl<
        $Res,
        BsGetOperationDetailResponse
      >;
  @useResult
  $Res call({bool success, String message, BsOperation? data});

  $BsOperationCopyWith<$Res>? get data;
}

/// @nodoc
class _$BsGetOperationDetailResponseCopyWithImpl<
  $Res,
  $Val extends BsGetOperationDetailResponse
>
    implements $BsGetOperationDetailResponseCopyWith<$Res> {
  _$BsGetOperationDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BsGetOperationDetailResponse
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
                      as BsOperation?,
          )
          as $Val,
    );
  }

  /// Create a copy of BsGetOperationDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BsOperationCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BsOperationCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BsGetOperationDetailResponseImplCopyWith<$Res>
    implements $BsGetOperationDetailResponseCopyWith<$Res> {
  factory _$$BsGetOperationDetailResponseImplCopyWith(
    _$BsGetOperationDetailResponseImpl value,
    $Res Function(_$BsGetOperationDetailResponseImpl) then,
  ) = __$$BsGetOperationDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, BsOperation? data});

  @override
  $BsOperationCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BsGetOperationDetailResponseImplCopyWithImpl<$Res>
    extends
        _$BsGetOperationDetailResponseCopyWithImpl<
          $Res,
          _$BsGetOperationDetailResponseImpl
        >
    implements _$$BsGetOperationDetailResponseImplCopyWith<$Res> {
  __$$BsGetOperationDetailResponseImplCopyWithImpl(
    _$BsGetOperationDetailResponseImpl _value,
    $Res Function(_$BsGetOperationDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BsGetOperationDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _$BsGetOperationDetailResponseImpl(
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
                  as BsOperation?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BsGetOperationDetailResponseImpl
    implements _BsGetOperationDetailResponse {
  const _$BsGetOperationDetailResponseImpl({
    required this.success,
    required this.message,
    this.data,
  });

  factory _$BsGetOperationDetailResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$BsGetOperationDetailResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final BsOperation? data;

  @override
  String toString() {
    return 'BsGetOperationDetailResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BsGetOperationDetailResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of BsGetOperationDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BsGetOperationDetailResponseImplCopyWith<
    _$BsGetOperationDetailResponseImpl
  >
  get copyWith =>
      __$$BsGetOperationDetailResponseImplCopyWithImpl<
        _$BsGetOperationDetailResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BsGetOperationDetailResponseImplToJson(this);
  }
}

abstract class _BsGetOperationDetailResponse
    implements BsGetOperationDetailResponse {
  const factory _BsGetOperationDetailResponse({
    required final bool success,
    required final String message,
    final BsOperation? data,
  }) = _$BsGetOperationDetailResponseImpl;

  factory _BsGetOperationDetailResponse.fromJson(Map<String, dynamic> json) =
      _$BsGetOperationDetailResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  BsOperation? get data;

  /// Create a copy of BsGetOperationDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BsGetOperationDetailResponseImplCopyWith<
    _$BsGetOperationDetailResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
