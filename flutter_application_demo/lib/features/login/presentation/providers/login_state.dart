import 'package:flutter_application_demo/features/login/domain/entities/user_entity.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState {
  final LoginStatus status;
  final UserEntity? user;
  final String? errorMessage;
  final String documentType;
  final String documentNumber;
  final bool rememberDocument;

  const LoginState({
    this.status = LoginStatus.initial,
    this.user,
    this.errorMessage,
    this.documentType = 'DNI',
    this.documentNumber = '',
    this.rememberDocument = false,
  });

  LoginState copyWith({
    LoginStatus? status,
    UserEntity? user,
    String? errorMessage,
    String? documentType,
    String? documentNumber,
    bool? rememberDocument,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
      rememberDocument: rememberDocument ?? this.rememberDocument,
    );
  }
}
