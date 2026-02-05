/*import 'dart:async';
import 'package:intl/intl.dart';
import 'package:otp/otp.dart';

import '../../domain/entities/totp_entity.dart';
import '../../domain/usecases/get_secret_use_case.dart';
import '../../domain/usecases/validate_otp_use_case.dart';
import 'package:flutter_application_demo/core/resources/data_state.dart';

abstract class IBloc {
  void initialize();
  void dispose();
}

class TotpBloc extends IBloc {
  TotpBloc(
    this._getSecretUseCase,
    this._validateOtpUseCase, [
    this._algorithm = OTPAlgorithm.SHA256,
    this._digits = 6,
  ]);

  late HOTP totp;
  String _otp = '';
  List<TotpEntity> _otpHistory = [];

  final OTPAlgorithm _algorithm;
  final int _digits;
  final GetSecretUseCase _getSecretUseCase;
  final ValidateOtpUseCase _validateOtpUseCase;

  final StreamController<TotpEntity> _otpController =
      StreamController<TotpEntity>.broadcast();
  final StreamController<List<TotpEntity>> _otpListController =
      StreamController<List<TotpEntity>>.broadcast();
  final StreamController<(String, bool)> _otpValidationController =
      StreamController<(String, bool)>.broadcast();

  Stream<TotpEntity> get otpStream => _otpController.stream;
  Stream<(String, bool)> get otpValidationStream =>
      _otpValidationController.stream;
  Stream<List<TotpEntity>> get otpListStream => _otpListController.stream;

  /* Se utiliza el package otp_util encargado de realizar la generacion de otp */
  Future<void> initializeOtp() async {
    _otpHistory.clear();
    _otpListController.sink.add(_otpHistory);
    var secret = await _getSecretUseCase.call();
    if (secret is DataSuccess) {
      var data = secret as DataSuccess<String>;
      totp = HOTP(
        secret: data.data!, // Semilla obtenida de backend
        algorithm: _algorithm,
        digits: _digits,
      );
    }
  }

  void generateOtp() {
    final time = DateTime.now();
    /* counter tiene correlacion con el codigo generado por backend, el cual
     * utiliza una ventana de 30 sec (this.timeStepSeconds = 30);
     */
    var counter = ((time.toUtc().millisecondsSinceEpoch ~/ 1000) ~/ 30);
    _otp = totp.generateOTP(input: counter);

    final model = TotpEntity(
      dateTime: time,
      otp: _otp,
      formattedDateTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(time),
    );
    _otpHistory.add(model);
    _otpController.sink.add(model);
    _otpListController.sink.add(_otpHistory);
  }

  Future<void> validateOtp() async {
    var currentTime = DateTime.now();
    var response = await _validateOtpUseCase.call(params: _otp);
    if (response is DataSuccess) {
      var data = response as DataSuccess<bool>;
      _otpValidationController.sink.add((
        DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime),
        data.data!,
      ));
    } else {
      _otpValidationController.sink.add((
        DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime),
        false,
      ));
    }
  }

  @override
  void dispose() {
    _otpController.close();
    _otpValidationController.close();
    _otpListController.close();
  }

  @override
  void initialize() {}
}*/
