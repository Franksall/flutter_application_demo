import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';

class GetRememberedDocumentUseCase {
  final AuthRepository repository;

  GetRememberedDocumentUseCase(this.repository);

  Future<Either<Failure, Map<String, String>?>> call() async {
    return await repository.getRememberedDocument();
  }
}
