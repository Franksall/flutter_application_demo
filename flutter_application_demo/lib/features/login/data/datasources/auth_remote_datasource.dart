import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/features/login/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String documentType,
    required String documentNumber,
    required String password,
  });
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<UserModel> login({
    required String documentType,
    required String documentNumber,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        '/auth/login',
        data: {
          'documentType': documentType,
          'documentNumber': documentNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Error al iniciar sesión',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      // 👇👇👇 ¡AQUÍ ES DONDE LO PONES! 👇👇👇
      print("🚨 ERROR CRÍTICO EN LOGIN: $e");

      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Error inesperado. Intenta nuevamente.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      // Esta es la línea que David verá en verde en la terminal
      await apiClient.post('/auth/logout');
    } catch (e) {
      // Si falla el servidor, lanzamos excepción para que el Repo la maneje
      throw ServerException(message: 'No se pudo cerrar sesión en el servidor');
    }
  }
}
