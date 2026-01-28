import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/login/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String documentType,
    required String documentNumber,
    required String password,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, bool>> isAuthenticated();

  Future<Either<Failure, UserEntity?>> getCurrentUser();

  Future<Either<Failure, void>> saveRememberDocument({
    required bool remember,
    required String documentNumber,
    required String documentType,
  });

  Future<Either<Failure, Map<String, String>?>> getRememberedDocument();
}
