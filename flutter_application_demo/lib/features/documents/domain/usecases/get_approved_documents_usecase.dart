import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/documents_response_entity.dart';
import 'package:flutter_application_demo/features/documents/domain/repositories/documents_repository.dart';

class GetApprovedDocumentsUseCase {
  final DocumentsRepository repository;

  GetApprovedDocumentsUseCase(this.repository);

  Future<Either<Failure, DocumentsResponseEntity>> call({int page = 1, int limit = 20}) async {
    return await repository.getApprovedDocuments(page: page, limit: limit);
  }
}
