import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_application_demo/core/error/failures.dart';
import 'package:flutter_application_demo/features/login/domain/entities/user_entity.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = LoginUseCase(mockAuthRepository);
  });

  const tDocumentType = 'DNI';
  const tDocumentNumber = '12345678';
  const tPassword = 'password123';

  const tUser = UserEntity(
    id: '1',
    documentNumber: tDocumentNumber,
    documentType: tDocumentType,
    name: 'Test User',
    token: 'test_token',
  );

  test('should return UserEntity when login is successful', () async {
    // Arrange
    when(
      () => mockAuthRepository.login(
        documentType: any(named: 'documentType'),
        documentNumber: any(named: 'documentNumber'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Right(tUser));

    // Act
    final result = await useCase(
      documentType: tDocumentType,
      documentNumber: tDocumentNumber,
      password: tPassword,
    );

    // Assert
    expect(result, const Right(tUser));
    verify(
      () => mockAuthRepository.login(
        documentType: tDocumentType,
        documentNumber: tDocumentNumber,
        password: tPassword,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return AuthenticationFailure when credentials are invalid',
      () async {
    // Arrange
    const tFailure = AuthenticationFailure('Credenciales inválidas');
    when(
      () => mockAuthRepository.login(
        documentType: any(named: 'documentType'),
        documentNumber: any(named: 'documentNumber'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(
      documentType: tDocumentType,
      documentNumber: tDocumentNumber,
      password: tPassword,
    );

    // Assert
    expect(result, const Left(tFailure));
    verify(
      () => mockAuthRepository.login(
        documentType: tDocumentType,
        documentNumber: tDocumentNumber,
        password: tPassword,
      ),
    ).called(1);
  });

  test('should return NetworkFailure when there is no internet connection',
      () async {
    // Arrange
    const tFailure =
        NetworkFailure('Error de conexión. Verifica tu red.');
    when(
      () => mockAuthRepository.login(
        documentType: any(named: 'documentType'),
        documentNumber: any(named: 'documentNumber'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await useCase(
      documentType: tDocumentType,
      documentNumber: tDocumentNumber,
      password: tPassword,
    );

    // Assert
    expect(result, const Left(tFailure));
  });
}
