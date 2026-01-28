import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_application_demo/features/login/data/models/user_model.dart';

class AuthMockDataSource implements AuthRemoteDataSource {
  @override
  Future<UserModel> login({
    required String documentType,
    required String documentNumber,
    required String password,
  }) async {
    // Simular delay de red
    await Future.delayed(const Duration(seconds: 1));

    try {
      // Cargar datos del JSON
      final String jsonString = await rootBundle.loadString(
        'assets/mock/users.json',
      );
      final Map<String, dynamic> data = json.decode(jsonString);
      final List<dynamic> users = data['users'];

      // Buscar usuario que coincida con las credenciales
      final userJson = users.firstWhere(
        (user) =>
            user['documentType'] == documentType &&
            user['documentNumber'] == documentNumber &&
            user['password'] == password,
        orElse: () => null,
      );

      if (userJson == null) {
        throw ServerException(
          message:
              'Credenciales incorrectas. Verifica tu documento y contraseña.',
          statusCode: 401,
        );
      }

      // Crear modelo de usuario sin incluir password en la respuesta
      return UserModel(
        id: userJson['id'],
        documentNumber: userJson['documentNumber'],
        documentType: userJson['documentType'],
        name: userJson['name'],
        token: userJson['token'],
        requiresFacialVerification:
            userJson['requiresFacialVerification'] ?? false,
      );
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException(message: 'Error al cargar datos de usuarios mock');
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    print("🚪 Mock Logout: Sesión limpiada localmente");
  }
}
