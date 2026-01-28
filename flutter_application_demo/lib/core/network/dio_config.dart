import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_config.dart';
import 'http_interceptor.dart';

/// Configuración de Dio para la aplicación
@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectionTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        sendTimeout: ApiConfig.sendTimeout,
        headers: {
          ApiConfig.headerContentType: ApiConfig.contentTypeJson,
          ApiConfig.headerAccept: ApiConfig.contentTypeJson,
        },
      ),
    );

    // Agregar interceptor de headers comunes (opcionales)
    // Los headers se agregan automáticamente a todas las peticiones si los providers están configurados
    // Si no se configuran los providers, las peticiones se realizan sin estos headers
    dio.interceptors.add(
      CommonHeadersInterceptor(
        // OPCIONAL: Configura providers para obtener userId y companyRuc dinámicamente
        // desde un servicio de autenticación o estado global
        // Ejemplo:
        // userIdProvider: () => GetIt.I<AuthService>().getUserId(),
        // companyRucProvider: () => GetIt.I<AuthService>().getCompanyRuc(),
      ),
    );

    // Agregar logging interceptor para desarrollo
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (object) {
          // Log para debugging
          print(object);
        },
      ),
    );

    return dio;
  }
}
