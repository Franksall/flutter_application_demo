/// Configuración de entorno de la aplicación
class AppConfig {
  AppConfig._();

  /// Determina si la app usa datos mock o API real
  ///
  /// true = Usa datos mock desde archivos JSON
  /// false = Usa API real con endpoints configurados
  static const bool useMockData = false;

  /// URL base de la API (solo se usa cuando useMockData = false)
  static const String apiBaseUrl = 'https://api.financieraoh.com';

  /// Timeout para requests HTTP (en segundos)
  static const int connectionTimeoutSeconds = 30;

  /// Habilitar logs de debug
  static const bool enableDebugLogs = true;

  /// Credenciales de prueba para modo mock
  /// IMPORTANTE: Estas credenciales solo funcionan en modo mock
  static const List<Map<String, String>> mockCredentials = [
    {
      'type': 'DNI',
      'number': '12345678',
      'password': '123456',
      'name': 'Juan Carlos Miranda',
    },
    {
      'type': 'DNI',
      'number': '87654321',
      'password': 'password',
      'name': 'María Elena Torres',
    },
    {
      'type': 'CE',
      'number': 'ABC123456',
      'password': '123456',
      'name': 'Diego Vasquez Medrano',
    },
  ];
}
