import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/core/utils/validators.dart';

void main() {
  group('validateDocumentNumber', () {
    group('DNI validation', () {
      test('should return null for valid DNI', () {
        final result = Validators.validateDocumentNumber(
          '12345678',
          AppConstants.dniType,
        );

        expect(result, null);
      });

      test('should return error for DNI with less than 8 digits', () {
        final result = Validators.validateDocumentNumber(
          '1234567',
          AppConstants.dniType,
        );

        expect(result, 'El DNI debe tener 8 dígitos');
      });

      test('should return error for DNI with more than 8 digits', () {
        final result = Validators.validateDocumentNumber(
          '123456789',
          AppConstants.dniType,
        );

        expect(result, 'El DNI debe tener 8 dígitos');
      });

      test('should return error for DNI with letters', () {
        final result = Validators.validateDocumentNumber(
          '1234567A',
          AppConstants.dniType,
        );

        expect(result, 'El DNI solo debe contener números');
      });

      test('should return error for empty DNI', () {
        final result = Validators.validateDocumentNumber(
          '',
          AppConstants.dniType,
        );

        expect(result, 'Ingresa tu número de documento');
      });
    });

    group('CE validation', () {
      test('should return null for valid CE', () {
        final result = Validators.validateDocumentNumber(
          'ABC123456',
          AppConstants.ceType,
        );

        expect(result, null);
      });

      test('should return error for CE with less than 9 characters', () {
        final result = Validators.validateDocumentNumber(
          'ABC12345',
          AppConstants.ceType,
        );

        expect(result, 'El CE debe tener entre 9 y 12 caracteres');
      });

      test('should return error for CE with more than 12 characters', () {
        final result = Validators.validateDocumentNumber(
          'ABC1234567890',
          AppConstants.ceType,
        );

        expect(result, 'El CE debe tener entre 9 y 12 caracteres');
      });

      test('should return error for CE with special characters', () {
        final result = Validators.validateDocumentNumber(
          'ABC123-456',
          AppConstants.ceType,
        );

        expect(result, 'El CE solo debe contener letras y números');
      });
    });
  });

  group('validatePassword', () {
    test('should return null for valid password', () {
      final result = Validators.validatePassword('password123');

      expect(result, null);
    });

    test('should return error for password with less than 6 characters', () {
      final result = Validators.validatePassword('pass1');

      expect(result, 'La contraseña debe tener al menos 6 caracteres');
    });

    test('should return error for empty password', () {
      final result = Validators.validatePassword('');

      expect(result, 'Ingresa tu contraseña');
    });

    test('should return error for null password', () {
      final result = Validators.validatePassword(null);

      expect(result, 'Ingresa tu contraseña');
    });
  });

  group('validateEmail', () {
    test('should return null for valid email', () {
      final result = Validators.validateEmail('test@example.com');

      expect(result, null);
    });

    test('should return error for invalid email format', () {
      final result = Validators.validateEmail('invalid-email');

      expect(result, 'Ingresa un correo electrónico válido');
    });

    test('should return error for empty email', () {
      final result = Validators.validateEmail('');

      expect(result, 'Ingresa tu correo electrónico');
    });

    test('should return error for email without @', () {
      final result = Validators.validateEmail('testexample.com');

      expect(result, 'Ingresa un correo electrónico válido');
    });
  });
}
