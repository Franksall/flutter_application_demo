import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/core/widgets/loading_screen.dart';
import 'package:flutter_application_demo/core/widgets/error_bottom_sheet.dart';
import 'package:flutter_application_demo/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_application_demo/features/login/presentation/providers/login_state.dart';

class LoginLoadingPage extends ConsumerWidget {
  const LoginLoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next.status == LoginStatus.success) {
        // Verificar si el usuario requiere verificación facial
        final user = next.user;
        if (user != null && user.requiresFacialVerification) {
          context.go(AppConstants.facialVerificationRoute);
        } else {
          context.go(AppConstants.documentsRoute);
        }
      } else if (next.status == LoginStatus.error) {
        context.go(AppConstants.loginRoute);
        ErrorBottomSheet.show(
          context,
          next.errorMessage ?? 'Error al iniciar sesión',
        );
      }
    });

    return const LoadingScreen(
      message: 'Validando credenciales',
    );
  }
}
