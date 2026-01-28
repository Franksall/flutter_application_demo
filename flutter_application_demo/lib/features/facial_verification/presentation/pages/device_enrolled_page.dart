import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

class DeviceEnrolledPage extends ConsumerWidget {
  const DeviceEnrolledPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
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

                    // Icono de éxito
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Título
                    Text(
                      'Dispositivo enrolado',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Mensaje
                    Text(
                      'Tu dispositivo ha sido enrolado exitosamente. Ya puedes acceder a todas las funciones de la aplicación.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Botón
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(AppConstants.documentsRoute);
                  },
                  child: const Text('Continuar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
