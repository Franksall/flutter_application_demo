import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

class IdentityValidationPage extends ConsumerStatefulWidget {
  const IdentityValidationPage({super.key});

  @override
  ConsumerState<IdentityValidationPage> createState() =>
      _IdentityValidationPageState();
}

class _IdentityValidationPageState
    extends ConsumerState<IdentityValidationPage> {
  @override
  void initState() {
    super.initState();
    // Simular validación de identidad
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppConstants.recoveryFacialVerificationRoute);
      }
    });
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
                SvgPicture.asset(
                  'logo-oh.svg',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 48),

                // Texto de validación
                Text(
                  'Validando identidad',
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
