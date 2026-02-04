import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_application_demo/core/usecases/usecase.dart';
import 'package:flutter_application_demo/core/resources/data_state.dart';
import '../repositories/i_otp_repository.dart';

class ValidateOtpUseCase implements UseCase<DataState<bool>, String> {
  ValidateOtpUseCase(this._repository, this._storage);

  final IOtpRepository _repository;
  final FlutterSecureStorage _storage;

  @override
  Future<DataState<bool>> call({required String params}) async {
    final String? secret = await _storage.read(key: 'otp_secret');
    final result = await _repository.validateOtp(
      otp: params,
      secret: secret ?? '',
    );
    return result;
  }
}
