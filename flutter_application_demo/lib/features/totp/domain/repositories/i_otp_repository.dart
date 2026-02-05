import 'package:flutter_application_demo/core/resources/data_state.dart';

abstract class IOtpRepository {
  Future<DataState<String>> enroll();

  Future<DataState<bool>> validateOtp({
    required String otp,
    required String secret,
  });
}
