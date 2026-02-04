import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/features/login/data/models/user_model.dart';
import 'package:dio/dio.dart';

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
        '/auth/ctaemp/login',
        options: Options(
          headers: {
            'x-api-key': 'PnUbTpebJ7FftGy4HCrfW7gSdaxAVjh0xOT1k9K7JLwIBJsw',
            'Content-Type': 'application/json',
          },
        ),

        data: {
          'codDocumento': documentType,
          'numDocumento': documentNumber,
          'contrasenia': password,
          'totp': '123456',
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Error al iniciar sesión',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Error inesperado. Intenta nuevamente.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await apiClient.post('/auth/logout');
    } catch (e) {
      throw ServerException(message: 'No se pudo cerrar sesión en el servidor');
    }
  }
}
