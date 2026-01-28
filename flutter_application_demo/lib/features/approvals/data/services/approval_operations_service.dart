import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_config.dart';
import '../models/list_operations_response_model.dart';
import '../models/operation_model.dart';
import '../models/operation_detail_model.dart';
import '../models/approval_sign_model.dart';
import '../models/approval_detail_model.dart';

/// Servicio para consumir la API de operaciones de aprobación
@injectable
class ApprovalOperationsService {
  final Dio _dio;

  ApprovalOperationsService(this._dio);

  /// Lista las operaciones de aprobación
  ///
  /// [status] - Estado de las operaciones (PENDING, APPROVED, etc.)
  /// [page] - Número de página (inicia en 1)
  /// [limit] - Registros por página
  Future<BsListOperationsResponse> listOperations({
    BsOperationStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      // Construir query parameters
      final Map<String, dynamic> queryParameters = {
        'page': page,
        'limit': limit,
      };

      if (status != null) {
        queryParameters['status'] = status.name.toUpperCase();
      }

      // Realizar petición (headers agregados por interceptor)
      final response = await _dio.get(
        ApiConfig.approvalsOperations,
        queryParameters: queryParameters,
      );

      // Parsear respuesta
      return BsListOperationsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Error inesperado al listar operaciones: $e');
    }
  }

  /// Lista las operaciones pendientes de aprobación
  ///
  /// [page] - Número de página (inicia en 1)
  /// [limit] - Registros por página
  Future<BsListOperationsResponse> listPendingOperations({
    int page = 1,
    int limit = 20,
  }) {
    return listOperations(
      status: BsOperationStatus.pending,
      page: page,
      limit: limit,
    );
  }

  /// Lista las operaciones aprobadas
  ///
  /// [page] - Número de página (inicia en 1)
  /// [limit] - Registros por página
  Future<BsListOperationsResponse> listApprovedOperations({
    int page = 1,
    int limit = 20,
  }) {
    return listOperations(
      status: BsOperationStatus.approved,
      page: page,
      limit: limit,
    );
  }

  /// Obtiene el detalle completo de una operación de aprobación
  ///
  /// [operationId] - ID de la operación (UUID)
  Future<BsGetOperationDetailResponse> getOperationDetail({
    required String operationId,
  }) async {
    try {
      // Construir endpoint reemplazando el parámetro
      final endpoint = ApiConfig.approvalsDetail.replaceAll(
        '{operationId}',
        operationId,
      );

      // Realizar petición (headers agregados por interceptor)
      final response = await _dio.get(endpoint);

      // Parsear respuesta
      return BsGetOperationDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Error inesperado al obtener detalle de operación: $e');
    }
  }

  /// Firma una operación (aprobar o rechazar)
  ///
  /// [operationId] - ID de la operación (UUID)
  /// [action] - Acción a realizar (APPROVE o REJECT)
  /// [approverUserId] - ID del usuario que aprueba/rechaza
  /// [operationTarget] - Target de la operación (opcional)
  Future<BsSignApprovalResponse> signApproval({
    required String operationId,
    required BsApprovalAction action,
    required String approverUserId,
    BsOperationTarget? operationTarget,
  }) async {
    try {
      // Construir endpoint reemplazando el parámetro
      final endpoint = ApiConfig.approvalsApprove.replaceAll(
        '{operationId}',
        operationId,
      );

      // Construir request body
      final requestBody = BsApprovalSignRequest(
        action: action,
        approverUserId: approverUserId,
        operationTarget: operationTarget,
      ).toJson();

      // Realizar petición (headers agregados por interceptor)
      final response = await _dio.post(
        endpoint,
        data: requestBody,
      );

      // Parsear respuesta
      return BsSignApprovalResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Error inesperado al firmar aprobación: $e');
    }
  }

  /// Aprueba una operación
  ///
  /// [operationId] - ID de la operación (UUID)
  /// [approverUserId] - ID del usuario que aprueba
  /// [operationTarget] - Target de la operación (opcional)
  Future<BsSignApprovalResponse> approveOperation({
    required String operationId,
    required String approverUserId,
    BsOperationTarget? operationTarget,
  }) {
    return signApproval(
      operationId: operationId,
      action: BsApprovalAction.approve,
      approverUserId: approverUserId,
      operationTarget: operationTarget,
    );
  }

  /// Rechaza una operación
  ///
  /// [operationId] - ID de la operación (UUID)
  /// [approverUserId] - ID del usuario que rechaza
  /// [operationTarget] - Target de la operación (opcional)
  Future<BsSignApprovalResponse> rejectOperation({
    required String operationId,
    required String approverUserId,
    BsOperationTarget? operationTarget,
  }) {
    return signApproval(
      operationId: operationId,
      action: BsApprovalAction.reject,
      approverUserId: approverUserId,
      operationTarget: operationTarget,
    );
  }

  /// Maneja errores de Dio y los convierte en excepciones más descriptivas
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Error de timeout: La conexión tardó demasiado');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Error del servidor';
        return Exception('Error HTTP $statusCode: $message');

      case DioExceptionType.cancel:
        return Exception('Petición cancelada');

      case DioExceptionType.connectionError:
        return Exception('Error de conexión: Verifique su conexión a internet');

      default:
        return Exception('Error inesperado: ${error.message}');
    }
  }
}
