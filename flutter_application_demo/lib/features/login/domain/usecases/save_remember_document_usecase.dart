import 'package:dartz/dartz.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';

class SaveRememberDocumentUseCase {
  final AuthRepository repository;

  SaveRememberDocumentUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required bool remember,
    required String documentNumber,
    required String documentType,
  }) async {
    return await repository.saveRememberDocument(
      remember: remember,
      documentNumber: documentNumber,
      documentType: documentType,
    );
  }
}
