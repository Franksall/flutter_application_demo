import 'package:flutter_application_demo/features/documents/data/models/document_model.dart';

/// Información de paginación para la lista de documentos
class DocumentsPagination {
  final int page;
  final int limit;
  final int total;
  final int pages;
  final bool hasNext;
  final bool hasPrevious;

  const DocumentsPagination({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
    required this.hasNext,
    required this.hasPrevious,
  });

  factory DocumentsPagination.fromJson(Map<String, dynamic> json) {
    return DocumentsPagination(
      page: json['page'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      pages: json['pages'] as int,
      hasNext: json['hasNext'] as bool,
      hasPrevious: json['hasPrevious'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'pages': pages,
      'hasNext': hasNext,
      'hasPrevious': hasPrevious,
    };
  }
}

/// Respuesta paginada de documentos
class DocumentsResponse {
  final List<DocumentModel> documents;
  final DocumentsPagination pagination;

  const DocumentsResponse({
    required this.documents,
    required this.pagination,
  });

  factory DocumentsResponse.fromJson(Map<String, dynamic> json) {
    final documentsJson = json['documents'] as List<dynamic>;
    final documents = documentsJson
        .map((doc) => DocumentModel.fromJson(doc as Map<String, dynamic>))
        .toList();

    return DocumentsResponse(
      documents: documents,
      pagination: DocumentsPagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documents': documents.map((doc) => doc.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}
