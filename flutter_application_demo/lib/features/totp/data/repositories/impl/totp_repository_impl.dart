import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/resources/data_state.dart';
import '../../domain/repositories/i_otp_repository.dart';

class TotpRepositoryImpl implements IOtpRepository {
  final ApiClient _apiClient;

  TotpRepositoryImpl(this._apiClient);

  @override
  Future<DataState<String>> enroll() async {
    try {
      final response = await _apiClient.post('/totp/enroll');

      if (response.statusCode == 200) {
        return DataSuccess(response.data["base32Secret"]);
      }
      return DataFailed('Error: ${response.statusCode}');
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> validateOtp({
    required String otp,
    required String secret,
  }) async {
    try {
      final response = await _apiClient.post(
        '/totp/validate',
        data: {'base32Secret': secret, 'otp': otp},
      );

      if (response.statusCode == 200) {
        return DataSuccess(response.data.toString().toLowerCase() == 'true');
      }
      return DataFailed('Error: ${response.statusCode}');
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
