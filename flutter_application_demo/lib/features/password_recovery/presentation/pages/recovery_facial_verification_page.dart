import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

class RecoveryFacialVerificationPage extends ConsumerStatefulWidget {
  const RecoveryFacialVerificationPage({super.key});

  @override
  ConsumerState<RecoveryFacialVerificationPage> createState() =>
      _RecoveryFacialVerificationPageState();
}

class _RecoveryFacialVerificationPageState
    extends ConsumerState<RecoveryFacialVerificationPage> {
  bool _isFaceCaptured = false;

  void _showTipsModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const _TipsModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calcular dimensiones del marco adaptativas
    final frameWidth = (screenWidth * 0.75).clamp(240.0, 300.0);
    final frameHeight = (screenHeight * 0.5).clamp(320.0, 400.0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Steps
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStep(1, false),
                          Container(
                            width: 40,
                            height: 2,
                            color: AppColors.border,
                          ),
                          _buildStep(2, true),
                          Container(
                            width: 40,
                            height: 2,
                            color: AppColors.border,
                          ),
                          _buildStep(3, false),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Título
                      Text(
                        'Verificación facial',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 40),

                      // Marco para el rostro
                      Container(
                        width: frameWidth,
                        height: frameHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _isFaceCaptured
                                ? const Color(0xFF4CAF50)
                                : AppColors.primary,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Placeholder para la cámara
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Center(
                                  child: Icon(
                                    _isFaceCaptured
                                        ? Icons.check_circle
                                        : Icons.person_outline,
                                    size: 120,
                                    color: _isFaceCaptured
                                        ? const Color(0xFF4CAF50)
                                        : AppColors.border,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Botones inferiores
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  // Botón de ayuda
                  if (!_isFaceCaptured)
                    IconButton(
                      onPressed: _showTipsModal,
                      icon: const Icon(
                        Icons.help_outline,
                        size: 28,
                        color: AppColors.primary,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: AppColors.border, width: 1),
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  if (!_isFaceCaptured) const SizedBox(width: 12),

                  // Botón principal
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_isFaceCaptured) {
                          context.go(AppConstants.recoveryBiometricValidationRoute);
                        } else {
                          // Simular captura de rostro
                          setState(() {
                            _isFaceCaptured = true;
                          });
                        }
                      },
                      icon: _isFaceCaptured ? null : const Icon(Icons.camera_alt),
                      label: Text(
                        _isFaceCaptured ? 'Continuar' : 'Capturar rostro',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int number, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.primary : const Color(0xFFD9D9D9),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFD9D9D9),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _TipsModal extends StatelessWidget {
  const _TipsModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado con título y botón cerrar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Consejos para la foto',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Lista de consejos
          _buildTipItem(
            context,
            icon: Icons.crop_free,
            text: 'Centra tu rostro dentro de la zona rectangular',
            iconColor: const Color(0xFF00BCD4),
          ),
          const SizedBox(height: 24),
          _buildTipItem(
            context,
            icon: Icons.wb_sunny_outlined,
            text: 'Asegúrate de tener buena iluminación frontal uniforme',
            iconColor: const Color(0xFFFFA726),
          ),
          const SizedBox(height: 24),
          _buildTipItem(
            context,
            icon: Icons.camera_alt_outlined,
            text: 'Mantén una expresión neutral y mira directamente a la cámara',
            iconColor: const Color(0xFF42A5F5),
          ),
          const SizedBox(height: 24),
          _buildTipItem(
            context,
            icon: Icons.check,
            text: 'Retira gafas, gorras o cualquier accesorio que cubra tu rostro',
            iconColor: const Color(0xFF66BB6A),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(BuildContext context,
      {required IconData icon, required String text, required Color iconColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.4,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
