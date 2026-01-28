import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/document_detail_entity.dart';
import 'package:flutter_application_demo/features/documents/domain/repositories/documents_repository.dart';

class GetDocumentDetailUseCase {
  final DocumentsRepository repository;

  GetDocumentDetailUseCase(this.repository);

  Future<Either<Failure, DocumentDetailEntity>> call(String documentId) async {
    return await repository.getDocumentDetail(documentId);
  }
}
