import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/features/login/data/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCache();
  Future<void> saveRememberDocument({
    required bool remember,
    required String documentNumber,
    required String documentType,
  });
  Future<Map<String, String>?> getRememberedDocument();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      await secureStorage.write(
        key: AppConstants.tokenKey,
        value: user.token,
      );
      await sharedPreferences.setString(
        AppConstants.userIdKey,
        user.id,
      );
    } catch (e) {
      throw CacheException(message: 'Error al guardar usuario');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final token = await secureStorage.read(key: AppConstants.tokenKey);
      final userId = sharedPreferences.getString(AppConstants.userIdKey);

      if (token == null || userId == null) {
        return null;
      }

      // For now, return null as we need to fetch user details from API
      return null;
    } catch (e) {
      throw CacheException(message: 'Error al obtener usuario');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await secureStorage.delete(key: AppConstants.tokenKey);
      await sharedPreferences.remove(AppConstants.userIdKey);
    } catch (e) {
      throw CacheException(message: 'Error al limpiar cache');
    }
  }

  @override
  Future<void> saveRememberDocument({
    required bool remember,
    required String documentNumber,
    required String documentType,
  }) async {
    try {
      if (remember) {
        await sharedPreferences.setString(
          AppConstants.documentNumberKey,
          documentNumber,
        );
        await sharedPreferences.setString(
          AppConstants.documentTypeKey,
          documentType,
        );
        await sharedPreferences.setBool(
          AppConstants.rememberDocumentKey,
          true,
        );
      } else {
        await sharedPreferences.remove(AppConstants.documentNumberKey);
        await sharedPreferences.remove(AppConstants.documentTypeKey);
        await sharedPreferences.setBool(
          AppConstants.rememberDocumentKey,
          false,
        );
      }
    } catch (e) {
      throw CacheException(message: 'Error al guardar documento');
    }
  }

  @override
  Future<Map<String, String>?> getRememberedDocument() async {
    try {
      final remember = sharedPreferences.getBool(
            AppConstants.rememberDocumentKey,
          ) ??
          false;

      if (!remember) return null;

      final documentNumber = sharedPreferences.getString(
        AppConstants.documentNumberKey,
      );
      final documentType = sharedPreferences.getString(
        AppConstants.documentTypeKey,
      );

      if (documentNumber == null || documentType == null) return null;

      return {
        'documentNumber': documentNumber,
        'documentType': documentType,
      };
    } catch (e) {
      throw CacheException(message: 'Error al obtener documento guardado');
    }
  }
}
