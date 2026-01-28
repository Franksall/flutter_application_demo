import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_demo/core/di/injection.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/get_remembered_document_usecase.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/save_remember_document_usecase.dart';
import 'package:flutter_application_demo/features/login/presentation/providers/login_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(
    loginUseCase: getIt<LoginUseCase>(),
    saveRememberDocumentUseCase: getIt<SaveRememberDocumentUseCase>(),
    getRememberedDocumentUseCase: getIt<GetRememberedDocumentUseCase>(),
  );
});

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase loginUseCase;
  final SaveRememberDocumentUseCase saveRememberDocumentUseCase;
  final GetRememberedDocumentUseCase getRememberedDocumentUseCase;

  LoginNotifier({
    required this.loginUseCase,
    required this.saveRememberDocumentUseCase,
    required this.getRememberedDocumentUseCase,
  }) : super(const LoginState()) {
    _loadRememberedDocument();
  }

  Future<void> _loadRememberedDocument() async {
    final result = await getRememberedDocumentUseCase();

    result.fold(
      (failure) {},
      (document) {
        if (document != null) {
          state = state.copyWith(
            documentType: document['documentType'],
            documentNumber: document['documentNumber'],
            rememberDocument: true,
          );
        }
      },
    );
  }

  void setDocumentType(String documentType) {
    state = state.copyWith(documentType: documentType);
  }

  void setDocumentNumber(String documentNumber) {
    state = state.copyWith(documentNumber: documentNumber);
  }

  void setRememberDocument(bool remember) {
    state = state.copyWith(rememberDocument: remember);
  }

  Future<void> login(String password) async {
    state = state.copyWith(
      status: LoginStatus.loading,
      errorMessage: null,
    );

    final result = await loginUseCase(
      documentType: state.documentType,
      documentNumber: state.documentNumber,
      password: password,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          status: LoginStatus.error,
          errorMessage: failure.message,
        );
      },
      (user) async {
        await saveRememberDocumentUseCase(
          remember: state.rememberDocument,
          documentNumber: state.documentNumber,
          documentType: state.documentType,
        );

        state = state.copyWith(
          status: LoginStatus.success,
          user: user,
        );
      },
    );
  }

  void resetState() {
    state = state.copyWith(
      status: LoginStatus.initial,
      errorMessage: null,
    );
  }
}
