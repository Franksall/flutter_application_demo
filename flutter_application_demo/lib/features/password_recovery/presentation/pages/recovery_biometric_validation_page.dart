import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/di/injection.dart';

class RecoveryBiometricValidationPage extends ConsumerStatefulWidget {
  const RecoveryBiometricValidationPage({super.key});

  @override
  ConsumerState<RecoveryBiometricValidationPage> createState() =>
      _RecoveryBiometricValidationPageState();
}

class _RecoveryBiometricValidationPageState
    extends ConsumerState<RecoveryBiometricValidationPage> {
  @override
  void initState() {
    super.initState();

    _ejecutarBypassPost();
  }

  Future<void> _ejecutarBypassPost() async {
    try {
      //   LOG
      await getIt<ApiClient>().post(
        '/api/identity/facial-enrollment-3d',
        data: {
          "externalDatabaseRefID": "12345678",
          "enrollmentIdentifier": "recovery_bypass_mode",
        },
      );

      // Esperamos 2 segundos para que se vea la animación del logo
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        context.go(AppConstants.recoveryPasswordRoute);
      }
    } catch (e) {
      //  falla pass, demo
      debugPrint("Error bypass POST: $e");
      if (mounted) {
        context.go(AppConstants.recoveryPasswordRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo OH!
                SvgPicture.asset('logo-oh.svg', width: 120, height: 120),
                const SizedBox(height: 48),

                // Texto de validación
                Text(
                  'Validando datos biométricos',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Spinner
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
