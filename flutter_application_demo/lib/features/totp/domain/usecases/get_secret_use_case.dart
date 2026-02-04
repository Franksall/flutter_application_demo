import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_application_demo/core/usecases/usecase.dart';
import 'package:flutter_application_demo/core/resources/data_state.dart';
import '../repositories/i_otp_repository.dart';

class GetSecretUseCase implements UseCase<DataState<String>, void> {
  GetSecretUseCase(this._repository, this._storage);

  final IOtpRepository _repository;
  final FlutterSecureStorage _storage;

  @override
  Future<DataState<String>> call({void params}) async {
    final result = await _repository.enroll();
    if (result is DataSuccess) {
      await _storage.write(key: 'otp_secret', value: result.data);
    }
    return result;
  }
}
