import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/document_detail_entity.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/documents_response_entity.dart';

abstract class DocumentsRepository {
  Future<Either<Failure, DocumentsResponseEntity>> getPendingDocuments({int page = 1, int limit = 20});
  Future<Either<Failure, DocumentsResponseEntity>> getApprovedDocuments({int page = 1, int limit = 20});
  Future<Either<Failure, DocumentDetailEntity>> getDocumentDetail(String documentId);
  Future<Either<Failure, void>> approveDocument(String documentId);
  Future<Either<Failure, void>> rejectDocument(String documentId);
}
