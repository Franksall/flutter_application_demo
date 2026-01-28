import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/documents/domain/repositories/documents_repository.dart';

class ApproveDocumentUseCase {
  final DocumentsRepository repository;

  ApproveDocumentUseCase(this.repository);

  Future<Either<Failure, void>> call(String documentId) async {
    return await repository.approveDocument(documentId);
  }
}
