import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_application_demo/features/login/presentation/pages/login_page.dart';
import 'package:flutter_application_demo/features/login/presentation/pages/login_loading_page.dart';
import 'package:flutter_application_demo/features/facial_verification/presentation/pages/facial_verification_page.dart';
import 'package:flutter_application_demo/features/facial_verification/presentation/pages/biometric_validation_page.dart';
import 'package:flutter_application_demo/features/facial_verification/presentation/pages/create_password_page.dart';
import 'package:flutter_application_demo/features/facial_verification/presentation/pages/device_enrollment_page.dart';
import 'package:flutter_application_demo/features/facial_verification/presentation/pages/device_enrolled_page.dart';
import 'package:flutter_application_demo/features/documents/presentation/pages/documents_page.dart';
import 'package:flutter_application_demo/features/password_recovery/presentation/pages/identity_verification_page.dart';
import 'package:flutter_application_demo/features/password_recovery/presentation/pages/identity_validation_page.dart';
import 'package:flutter_application_demo/features/password_recovery/presentation/pages/recovery_facial_verification_page.dart';
import 'package:flutter_application_demo/features/password_recovery/presentation/pages/recovery_biometric_validation_page.dart';
import 'package:flutter_application_demo/features/password_recovery/presentation/pages/recovery_password_page.dart';
import 'package:flutter_application_demo/features/totp/presentation/screen/totp_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppConstants.splashRoute,
  routes: [
    GoRoute(
      path: AppConstants.splashRoute,
      name: 'splash',
      pageBuilder: (context, state) => const MaterialPage(child: SplashPage()),
    ),
    GoRoute(
      path: AppConstants.loginRoute,
      name: 'login',
      pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
    ),
    GoRoute(
      path: AppConstants.loginLoadingRoute,
      name: 'login-loading',
      pageBuilder: (context, state) =>
          const MaterialPage(child: LoginLoadingPage()),
    ),
    GoRoute(
      path: AppConstants.facialVerificationRoute,
      name: 'facial-verification',
      pageBuilder: (context, state) =>
          const MaterialPage(child: FacialVerificationPage()),
    ),
    GoRoute(
      path: AppConstants.biometricValidationRoute,
      name: 'biometric-validation',
      pageBuilder: (context, state) =>
          const MaterialPage(child: BiometricValidationPage()),
    ),
    GoRoute(
      path: AppConstants.createPasswordRoute,
      name: 'create-password',
      pageBuilder: (context, state) =>
          const MaterialPage(child: CreatePasswordPage()),
    ),
    GoRoute(
      path: AppConstants.deviceEnrollmentRoute,
      name: 'device-enrollment',
      pageBuilder: (context, state) =>
          const MaterialPage(child: DeviceEnrollmentPage()),
    ),
    GoRoute(
      path: AppConstants.deviceEnrolledRoute,
      name: 'device-enrolled',
      pageBuilder: (context, state) =>
          const MaterialPage(child: DeviceEnrolledPage()),
    ),
    GoRoute(
      path: AppConstants.documentsRoute,
      name: 'documents',
      pageBuilder: (context, state) =>
          const MaterialPage(child: DocumentsPage()),
    ),
    GoRoute(
      path: AppConstants.identityVerificationRoute,
      name: 'identity-verification',
      pageBuilder: (context, state) =>
          const MaterialPage(child: IdentityVerificationPage()),
    ),
    GoRoute(
      path: AppConstants.identityValidationRoute,
      name: 'identity-validation',
      pageBuilder: (context, state) =>
          const MaterialPage(child: IdentityValidationPage()),
    ),
    GoRoute(
      path: AppConstants.recoveryFacialVerificationRoute,
      name: 'recovery-facial-verification',
      pageBuilder: (context, state) =>
          const MaterialPage(child: RecoveryFacialVerificationPage()),
    ),
    GoRoute(
      path: AppConstants.recoveryBiometricValidationRoute,
      name: 'recovery-biometric-validation',
      pageBuilder: (context, state) =>
          const MaterialPage(child: RecoveryBiometricValidationPage()),
    ),
    GoRoute(
      path: AppConstants.recoveryPasswordRoute,
      name: 'recovery-password',
      pageBuilder: (context, state) =>
          const MaterialPage(child: RecoveryPasswordPage()),
    ),
    GoRoute(
      path: '/totp', // Esta es la dirección "mágica"
      name: 'totp',
      pageBuilder: (context, state) => const MaterialPage(child: TotpScreen()),
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('Página no encontrada: ${state.uri}'))),
);
