import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/documents/data/datasources/documents_remote_datasource.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/document_detail_entity.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/documents_response_entity.dart';
import 'package:flutter_application_demo/features/documents/domain/repositories/documents_repository.dart';

class DocumentsRepositoryImpl implements DocumentsRepository {
  final DocumentsRemoteDataSource remoteDataSource;

  DocumentsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, DocumentsResponseEntity>> getPendingDocuments({int page = 1, int limit = 20}) async {
    try {
      final response = await remoteDataSource.getPendingDocuments(page: page, limit: limit);

      // Convertir el modelo de datos a la entidad de dominio
      final paginationEntity = DocumentsPaginationEntity(
        page: response.pagination.page,
        limit: response.pagination.limit,
        total: response.pagination.total,
        pages: response.pagination.pages,
        hasNext: response.pagination.hasNext,
        hasPrevious: response.pagination.hasPrevious,
      );

      final responseEntity = DocumentsResponseEntity(
        documents: response.documents,
        pagination: paginationEntity,
      );

      return Right(responseEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, DocumentsResponseEntity>> getApprovedDocuments({int page = 1, int limit = 20}) async {
    try {
      final response = await remoteDataSource.getApprovedDocuments(page: page, limit: limit);

      // Convertir el modelo de datos a la entidad de dominio
      final paginationEntity = DocumentsPaginationEntity(
        page: response.pagination.page,
        limit: response.pagination.limit,
        total: response.pagination.total,
        pages: response.pagination.pages,
        hasNext: response.pagination.hasNext,
        hasPrevious: response.pagination.hasPrevious,
      );

      final responseEntity = DocumentsResponseEntity(
        documents: response.documents,
        pagination: paginationEntity,
      );

      return Right(responseEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, DocumentDetailEntity>> getDocumentDetail(String documentId) async {
    try {
      final detail = await remoteDataSource.getDocumentDetail(documentId);
      return Right(detail);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> approveDocument(String documentId) async {
    try {
      await remoteDataSource.approveDocument(documentId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> rejectDocument(String documentId) async {
    try {
      await remoteDataSource.rejectDocument(documentId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error inesperado: ${e.toString()}'));
    }
  }
}
