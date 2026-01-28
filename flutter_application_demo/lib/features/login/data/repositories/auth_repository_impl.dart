import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/exceptions.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/login/data/datasources/auth_local_datasource.dart';
import 'package:flutter_application_demo/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_application_demo/features/login/domain/entities/user_entity.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String documentType,
    required String documentNumber,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        documentType: documentType,
        documentNumber: documentNumber,
        password: password,
      );

      await localDataSource.cacheUser(user);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // LLAMADA AL SERVIDOR
      await remoteDataSource.logout();

      await localDataSource.clearCache();

      return const Right(null);
    } catch (e) {
      // Incluso si falla el logout en el servidor, limpiamos el cache local
      await localDataSource.clearCache();

      // navegue al Login de todos modos
      return const Right(null);
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      final user = await localDataSource.getCachedUser();
      return Right(user != null);
    } catch (e) {
      return const Right(false);
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await localDataSource.getCachedUser();
      return Right(user);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error al obtener usuario'));
    }
  }

  @override
  Future<Either<Failure, void>> saveRememberDocument({
    required bool remember,
    required String documentNumber,
    required String documentType,
  }) async {
    try {
      await localDataSource.saveRememberDocument(
        remember: remember,
        documentNumber: documentNumber,
        documentType: documentType,
      );
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error al guardar documento'));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>?>> getRememberedDocument() async {
    try {
      final document = await localDataSource.getRememberedDocument();
      return Right(document);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Error al obtener documento guardado'));
    }
  }
}
