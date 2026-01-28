import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/login/domain/entities/user_entity.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String documentType,
    required String documentNumber,
    required String password,
  }) async {
    return await repository.login(
      documentType: documentType,
      documentNumber: documentNumber,
      password: password,
    );
  }
}
