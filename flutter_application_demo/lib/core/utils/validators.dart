import 'package:flutter_application_demo/core/constants/app_constants.dart';

class Validators {
  Validators._();

  static String? validateDocumentNumber(String? value, String documentType) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu número de documento';
    }

    final cleanValue = value.trim();

    if (documentType == AppConstants.dniType) {
      if (cleanValue.length != AppConstants.dniLength) {
        return 'El DNI debe tener ${AppConstants.dniLength} dígitos';
      }
      if (!RegExp(r'^\d+$').hasMatch(cleanValue)) {
        return 'El DNI solo debe contener números';
      }
    } else if (documentType == AppConstants.ceType) {
      if (cleanValue.length < AppConstants.ceMinLength ||
          cleanValue.length > AppConstants.ceMaxLength) {
        return 'El CE debe tener entre ${AppConstants.ceMinLength} y ${AppConstants.ceMaxLength} caracteres';
      }
      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(cleanValue)) {
        return 'El CE solo debe contener letras y números';
      }
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }

    if (value.length < AppConstants.passwordMinLength) {
      return 'La contraseña debe tener al menos ${AppConstants.passwordMinLength} caracteres';
    }

    return null;
  }

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu correo electrónico';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido';
    }

    return null;
  }
}
