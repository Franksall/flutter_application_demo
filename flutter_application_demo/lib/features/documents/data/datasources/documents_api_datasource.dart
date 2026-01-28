import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/features/approvals/data/services/approval_operations_service.dart';
import 'package:flutter_application_demo/features/approvals/data/models/operation_model.dart';
import 'package:flutter_application_demo/features/documents/data/models/document_model.dart';
import 'package:flutter_application_demo/features/documents/data/models/document_detail_model.dart';
import 'package:flutter_application_demo/features/documents/data/models/documents_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'documents_remote_datasource.dart';

/// Datasource que consume la API real de aprobaciones
@Injectable(as: DocumentsRemoteDataSource)
class DocumentsApiDataSource implements DocumentsRemoteDataSource {
  final ApprovalOperationsService _approvalService;

  DocumentsApiDataSource(this._approvalService);

  /// Mapea el tipo de operación del enum a un string legible
  String _mapOperationType(BsOperationType type) {
    switch (type) {
      case BsOperationType.payrollPayment:
        return 'Pago de Haberes';
      case BsOperationType.ctsPayment:
        return 'Pago de CTS';
      case BsOperationType.interbankTransfer:
        return 'Transferencia Interbancaria';
      case BsOperationType.ownTransfer:
        return 'Transferencia Propia';
    }
  }

  /// Formatea la fecha de operación de ISO 8601 a dd/MM/yyyy hh:mm a
  /// Ejemplo: 2026-01-06T14:51:18.373973 -> 06/01/2026 02:51 pm
  String _formatOperationDate(String isoDate) {
    try {
      final dateTime = DateTime.parse(isoDate);
      final formatter = DateFormat('dd/MM/yyyy hh:mm a', 'es');
      return formatter.format(dateTime).toLowerCase();
    } catch (e) {
      return isoDate;
    }
  }

  @override
  Future<DocumentsResponse> getPendingDocuments({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _approvalService.listPendingOperations(
        page: page,
        limit: limit,
      );

      if (response.success && response.data != null) {
        final operations = response.data!.operations;
        final paginationData = response.data!.pagination;

        // Convertir las operaciones a DocumentModel
        final documents = operations.map((operation) {
          return DocumentModel.fromJson({
            'id': operation.operationId,
            'title': operation.operationName,
            'type': _mapOperationType(operation.operationType),
            'operationDate': _formatOperationDate(operation.operationDate),
            'currency': operation.currency?.name.toUpperCase() ?? 'PEN',
            'amount': operation.amount ?? 0.0,
            'commission': operation.commision,
            'operation': _mapOperationType(operation.operationType),
            'createdAt': operation.createdAt,
            'status': operation.status.name,
            'sourceAccount': operation.sourceAccount != null
                ? {'accountNumber': operation.sourceAccount!.accountNumber}
                : null,
            'destinationAccount': operation.destinationAccount != null
                ? {
                    'accountNumber':
                        operation.destinationAccount!.accountNumber,
                    'beneficiaryName':
                        operation.destinationAccount!.beneficiaryName,
                  }
                : null,
            'approvalLevelsRequired': operation.approvalLevelsRequired,
            'currentApprovalLevel': operation.currentApprovalLevel,
          });
        }).toList();

        // Crear la respuesta con paginación
        final pagination = DocumentsPagination(
          page: paginationData.page,
          limit: paginationData.limit,
          total: paginationData.total,
          pages: paginationData.pages,
          hasNext: paginationData.hasNext ?? false,
          hasPrevious: paginationData.hasPrevious ?? false,
        );

        return DocumentsResponse(documents: documents, pagination: pagination);
      }

      throw ServerException(message: response.message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Error inesperado al obtener documentos pendientes: $e',
      );
    }
  }

  @override
  Future<DocumentsResponse> getApprovedDocuments({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _approvalService.listApprovedOperations(
        page: page,
        limit: limit,
      );

      if (response.success && response.data != null) {
        final operations = response.data!.operations;
        final paginationData = response.data!.pagination;

        // Convertir las operaciones a DocumentModel
        final documents = operations.map((operation) {
          return DocumentModel.fromJson({
            'id': operation.operationId,
            'title': operation.operationName,
            'type': _mapOperationType(operation.operationType),
            'operationDate': _formatOperationDate(operation.operationDate),
            'currency': operation.currency?.name.toUpperCase() ?? 'PEN',
            'amount': operation.amount ?? 0.0,
            'commission': operation.commision,
            'operation': _mapOperationType(operation.operationType),
            'createdAt': operation.createdAt,
            'status': operation.status.name,
            'sourceAccount': operation.sourceAccount != null
                ? {'accountNumber': operation.sourceAccount!.accountNumber}
                : null,
            'destinationAccount': operation.destinationAccount != null
                ? {
                    'accountNumber':
                        operation.destinationAccount!.accountNumber,
                    'beneficiaryName':
                        operation.destinationAccount!.beneficiaryName,
                  }
                : null,
            'approvalLevelsRequired': operation.approvalLevelsRequired,
            'currentApprovalLevel': operation.currentApprovalLevel,
          });
        }).toList();

        // Crear la respuesta con paginación
        final pagination = DocumentsPagination(
          page: paginationData.page,
          limit: paginationData.limit,
          total: paginationData.total,
          pages: paginationData.pages,
          hasNext: paginationData.hasNext ?? false,
          hasPrevious: paginationData.hasPrevious ?? false,
        );

        return DocumentsResponse(documents: documents, pagination: pagination);
      }

      throw ServerException(message: response.message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Error inesperado al obtener documentos aprobados: $e',
      );
    }
  }

  @override
  Future<DocumentDetailModel> getDocumentDetail(String documentId) async {
    try {
      final response = await _approvalService.getOperationDetail(
        operationId: documentId,
      );

      if (response.success && response.data != null) {
        final operation = response.data!;

        return DocumentDetailModel(
          operationId: operation.operationId,
          operationName: operation.operationName,
          operationDate: _formatOperationDate(operation.operationDate),
          status: operation.status.name.toUpperCase(),
          sourceAccountNumber: operation.sourceAccountNumber,
          sourceAccountType: operation.sourceAccountType.name.toUpperCase(),
          beneficiaryName: operation.beneficiaryName,
          transferType: _mapTransferType(operation.transferType),
          amount: operation.amount,
          currency: operation.currency.name.toUpperCase(),
          destinationAccountNumber: operation.destinationAccountNumber,
          approvalLevelsRequired: operation.approvalLevelsRequired,
          currentApprovalLevel: operation.currentApprovalLevel,
          expiresAt: operation.expiresAt,
          approvedAt: operation.approvedAt,
          rejectedAt: operation.rejectedAt,
          approvals:
              operation.approvals?.map((approval) {
                return ApprovalModel(
                  approvalId: approval.approvalId,
                  operationId: approval.operationId,
                  approverUserId: approval.approverUserId,
                  approvalName: approval.approvalName,
                  approvalLevel: approval.approvalLevel,
                  status: approval.status.name.toUpperCase(),
                  action: approval.action?.name.toUpperCase(),
                  rejectionReason: approval.rejectionReason,
                  passwordVerified: approval.passwordVerified,
                  otpVerified: approval.otpVerified,
                  signedAt: approval.signedAt,
                  expiresAt: approval.expiresAt,
                );
              }).toList() ??
              [],
        );
      }

      throw ServerException(message: response.message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Error inesperado al obtener detalle del documento: $e',
      );
    }
  }

  /// Mapea el tipo de transferencia del enum a un string legible
  String _mapTransferType(BsTransferType type) {
    switch (type) {
      case BsTransferType.payrollPayment:
        return 'Pago de Haberes';
      case BsTransferType.ctsPayment:
        return 'Pago de CTS';
      case BsTransferType.interbankTransfer:
        return 'Transferencia Interbancaria';
      case BsTransferType.ownTransfer:
        return 'Transferencia Propia';
    }
  }

  @override
  Future<void> approveDocument(String documentId) async {
    try {
      final response = await _approvalService.approveOperation(
        operationId: documentId,
        approverUserId: 'current-user-id', // TODO: Obtener del auth service
      );

      if (!response.success) {
        throw ServerException(message: response.message);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Error inesperado al aprobar documento: $e',
      );
    }
  }

  @override
  Future<void> rejectDocument(String documentId) async {
    try {
      final response = await _approvalService.rejectOperation(
        operationId: documentId,
        approverUserId:
            '550e8400-e29b-41d4-a716-446655440000', // TODO: Obtener del auth service
      );

      if (!response.success) {
        throw ServerException(message: response.message);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'Error inesperado al rechazar documento: $e',
      );
    }
  }
}
