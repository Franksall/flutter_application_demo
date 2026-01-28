import 'package:flutter_application_demo/features/documents/domain/entities/document_entity.dart';

/// Información de paginación para la respuesta de documentos
class DocumentsPaginationEntity {
  final int page;
  final int limit;
  final int total;
  final int pages;
  final bool hasNext;
  final bool hasPrevious;

  const DocumentsPaginationEntity({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
    required this.hasNext,
    required this.hasPrevious,
  });
}

/// Respuesta paginada de documentos en la capa de dominio
class DocumentsResponseEntity {
  final List<DocumentEntity> documents;
  final DocumentsPaginationEntity pagination;

  const DocumentsResponseEntity({
    required this.documents,
    required this.pagination,
  });
}
