class AppConstants {
  AppConstants._();

  static const String appName = 'FOH App Mobile Aprobador';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String rememberDocumentKey = 'remember_document';
  static const String documentNumberKey = 'document_number';
  static const String documentTypeKey = 'document_type';

  // Document Types
  static const String dniType = 'DNI';
  static const String ceType = 'CE';
  static const String passportType = 'Pasaporte';

  // Validation
  static const int dniLength = 8;
  static const int ceMinLength = 9;
  static const int ceMaxLength = 12;
  static const int passwordMinLength = 6;

  // Routes
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String loginLoadingRoute = '/login-loading';
  static const String facialVerificationRoute = '/facial-verification';
  static const String biometricValidationRoute = '/biometric-validation';
  static const String createPasswordRoute = '/create-password';
  static const String deviceEnrollmentRoute = '/device-enrollment';
  static const String deviceEnrolledRoute = '/device-enrolled';
  static const String documentsRoute = '/documents';

  // Password Recovery Routes
  static const String identityVerificationRoute = '/identity-verification';
  static const String identityValidationRoute = '/identity-validation';
  static const String recoveryFacialVerificationRoute = '/recovery-facial-verification';
  static const String recoveryBiometricValidationRoute = '/recovery-biometric-validation';
  static const String recoveryPasswordRoute = '/recovery-password';

  // Transaction Types
  static const String pagoDeHaberesType = 'Pago de haberes';
  static const String transferenciaType = 'Transferencia';

  // Currency
  static const String solesCurrency = 'Soles';
  static const String dolaresCurrency = 'Dólares';
}
