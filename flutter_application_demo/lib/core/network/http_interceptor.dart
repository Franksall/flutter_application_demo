import 'package:dio/dio.dart';

/// Interceptor para agregar headers comunes a todas las peticiones HTTP
class CommonHeadersInterceptor extends Interceptor {
  final String Function()? userIdProvider;
  final String Function()? companyRucProvider;

  CommonHeadersInterceptor({
    this.userIdProvider,
    this.companyRucProvider,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Agregar headers comunes
    final userId = userIdProvider?.call();
    if (userId != null && userId.isNotEmpty) {
      options.headers['X-Creation-User-Id'] = userId;
    }

    final companyRuc = companyRucProvider?.call();
    if (companyRuc != null && companyRuc.isNotEmpty) {
      options.headers['X-Company-RUC'] = companyRuc;
    }

    // Header de Content-Type por defecto
    if (!options.headers.containsKey('Content-Type')) {
      options.headers['Content-Type'] = 'application/json';
    }

    // Header de Accept por defecto
    if (!options.headers.containsKey('Accept')) {
      options.headers['Accept'] = 'application/json';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Aquí puedes agregar lógica para interceptar respuestas si es necesario
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Aquí puedes agregar lógica para manejar errores si es necesario
    super.onError(err, handler);
  }
}
