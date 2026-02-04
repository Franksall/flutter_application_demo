import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class TotpRepositoryImpl implements IOtpRepository {
  TotpRepositoryImpl({required this.baseUrl});

  /** Para casos practicos y al haber probado localmente, la base
   * url utilizada fue http://localhost:8080/totp
   * En emulador android -> http://10.0.2.2:8080/totp
   */
  final String baseUrl;

  @override
  Future<DataState<String>> enroll() async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/enroll'));

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        return DataSuccess(body["base32Secret"]);
      }
      return DataFailed('Error: ${response.statusCode}');
    } catch (e) {
      return DataFailed('$e');
    }
  }

  @override
  Future<DataState<bool>> validateOtp({
    required String otp,
    required String secret,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/validate'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{'base32Secret': secret, 'otp': otp}),
      );

      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.body.toLowerCase() == 'true');
      }
      return DataFailed('Error: ${response.statusCode}');
    } catch (e) {
      return DataFailed('$e');
    }
  }
}
