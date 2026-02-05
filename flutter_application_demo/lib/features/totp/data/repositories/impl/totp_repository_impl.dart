import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/resources/data_state.dart';
import 'package:flutter_application_demo/features/totp/domain/repositories/i_otp_repository.dart';

class TotpRepositoryImpl implements IOtpRepository {
  // Usamos ApiClient (Servicio Centralizado)
  // En lugar de 'baseUrl' pegada aquí, usamos la configuración global de la App.
  // Esto maneja automáticamente los Headers (x-api-key) y el ambiente.
  final ApiClient _apiClient;

  TotpRepositoryImpl(this._apiClient);

  @override
  Future<DataState<String>> enroll() async {
    try {
      //  Endpoint limpio
      // Si en el futuro hay que enviar datos, solo agregamos "data: {...}"
      final response = await _apiClient.post('/totp/enroll');

      if (response.statusCode == 200) {
        //  Validación y Extracción segura
        // Dio ya hace el jsonDecode automáticamente
        final secret = response.data["base32Secret"];

        if (secret != null) {
          return DataSuccess(secret.toString());
        } else {
          return DataFailed("El servidor no devolvió el 'base32Secret'");
        }
      }
      return DataFailed('Error del servidor: ${response.statusCode}');
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
      //  Reutilización del servicio para validar
      final response = await _apiClient.post(
        '/totp/validate',
        data: {'base32Secret': secret, 'otp': otp},
      );

      if (response.statusCode == 200) {
        // El backend puede devolver un booleano (true) o un string ("true")
        return DataSuccess(response.data.toString().toLowerCase() == 'true');
      }
      return DataFailed('Error del servidor: ${response.statusCode}');
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
