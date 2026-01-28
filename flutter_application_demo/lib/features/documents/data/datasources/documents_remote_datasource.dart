import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/features/documents/data/models/document_model.dart';
import 'package:flutter_application_demo/features/documents/data/models/document_detail_model.dart';
import 'package:flutter_application_demo/features/documents/data/models/documents_response_model.dart';

abstract class DocumentsRemoteDataSource {
  Future<DocumentsResponse> getPendingDocuments({int page = 1, int limit = 20});
  Future<DocumentsResponse> getApprovedDocuments({int page = 1, int limit = 20});
  Future<DocumentDetailModel> getDocumentDetail(String documentId);
  Future<void> approveDocument(String documentId);
  Future<void> rejectDocument(String documentId);
}

class DocumentsRemoteDataSourceImpl implements DocumentsRemoteDataSource {
  final ApiClient apiClient;

  DocumentsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<DocumentsResponse> getPendingDocuments({int page = 1, int limit = 20}) async {
    try {
      final response = await apiClient.get('/documents/pending?page=$page&limit=$limit');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] as List<dynamic>;
        final documents = data.map((json) => DocumentModel.fromJson(json)).toList();

        final pagination = DocumentsPagination.fromJson(
          response.data['pagination'] as Map<String, dynamic>,
        );

        return DocumentsResponse(
          documents: documents,
          pagination: pagination,
        );
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Error al obtener documentos',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(
        message: 'Error inesperado al obtener documentos',
      );
    }
  }

  @override
  Future<DocumentsResponse> getApprovedDocuments({int page = 1, int limit = 20}) async {
    try {
      final response = await apiClient.get('/documents/approved?page=$page&limit=$limit');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] as List<dynamic>;
        final documents = data.map((json) => DocumentModel.fromJson(json)).toList();

        final pagination = DocumentsPagination.fromJson(
          response.data['pagination'] as Map<String, dynamic>,
        );

        return DocumentsResponse(
          documents: documents,
          pagination: pagination,
        );
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Error al obtener documentos',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(
        message: 'Error inesperado al obtener documentos',
      );
    }
  }

  @override
  Future<DocumentDetailModel> getDocumentDetail(String documentId) async {
    try {
      final response = await apiClient.get('/documents/$documentId');

      if (response.statusCode == 200) {
        return DocumentDetailModel.fromJson(
          response.data['data'] as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Error al obtener detalle del documento',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(
        message: 'Error inesperado al obtener detalle del documento',
      );
    }
  }

  @override
  Future<void> approveDocument(String documentId) async {
    try {
      final response = await apiClient.post(
        '/documents/$documentId/approve',
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Error al aprobar documento',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(
        message: 'Error inesperado al aprobar documento',
      );
    }
  }

  @override
  Future<void> rejectDocument(String documentId) async {
    try {
      final response = await apiClient.post(
        '/documents/$documentId/reject',
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Error al rechazar documento',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(
        message: 'Error inesperado al rechazar documento',
      );
    }
  }
}
