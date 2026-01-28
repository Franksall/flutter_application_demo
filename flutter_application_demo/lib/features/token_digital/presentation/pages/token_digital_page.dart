import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/features/token_digital/presentation/providers/token_provider.dart';

class TokenDigitalPage extends ConsumerWidget {
  const TokenDigitalPage({super.key});

  Color _getProgressColor(int seconds) {
    if (seconds >= 21) {
      return const Color(0xFF1A73E8); // Azul
    } else if (seconds >= 11) {
      return const Color(0xFFFBC02D); // Amarillo
    } else {
      return const Color(0xFFC62828); // Rojo
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenState = ref.watch(tokenProvider);
    final progressColor = _getProgressColor(tokenState.remainingSeconds);
    final progressValue = tokenState.remainingSeconds / TokenNotifier.tokenDuration;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo del token digital
                SvgPicture.asset(
                  'token-digital-logo.svg',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 40),

                // Dígitos del token
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: tokenState.token.split('').map((digit) {
                    return Container(
                      width: 35,
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          digit,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // Barra de progreso
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: const Color(0xFFEEEEEE),
                      valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Expira en ${tokenState.remainingSeconds}s',
                      style: TextStyle(
                        fontSize: 14,
                        color: progressColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Texto informativo
                Text(
                  'Tu token es confidencial. No lo envíes ni compartas por ningún medio.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
