/// Configuración de la API
class ApiConfig {
  // URLs de los servidores
  static const String productionUrl = 'https://api.financieraoh.com/v1';
  static const String stagingUrl = 'https://api-staging.financieraoh.com/v1';
  static const String developmentUrl = 'http://localhost:8000/v1';

  static const String faceTecSessionToken = '/api/session-token/{dni}';
  static const String faceTecEnrollment3D =
      '/api/identity/facial-enrollment-3d';
  static const String faceTecDocumentMatch = '/api/identity/document-match';

  // URL base actual
  static const String baseUrl = developmentUrl;

  // Endpoints
  static const String approvalsOperations = '/approvals/operations';
  static const String approvalsDetail = '/approvals/{operationId}';
  static const String approvalsStatus = '/approvals/{operationId}/status';
  static const String approvalsApprove = '/approvals/{operationId}/approve';
  static const String approvalsGetByCorrelation =
      '/approvals/get/{correlationId}';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Headers comunes
  static const String headerContentType = 'Content-Type';
  static const String headerAccept = 'Accept';
  static const String headerCorrelationId = 'X-Correlation-Id';
  static const String headerCreationUserId = 'X-Creation-User-Id';
  static const String headerCompanyRuc = 'X-Company-RUC';

  // Valores por defecto
  static const String contentTypeJson = 'application/json';
}
