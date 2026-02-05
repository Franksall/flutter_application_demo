import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Importa tu provider
import 'package:flutter_application_demo/features/totp/presentation/providers/totp_provider.dart';

class TotpScreen extends ConsumerStatefulWidget {
  const TotpScreen({super.key});

  @override
  ConsumerState<TotpScreen> createState() => _TotpScreenState();
}

class _TotpScreenState extends ConsumerState<TotpScreen> {
  Timer? _timer;
  double _progress = 1.0;

  @override
  void initState() {
    super.initState();
    // 1. Al iniciar, pedimos el secreto
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(totpProvider.notifier).initializeOtp();
    });

    // 2. Timer visual para la barra de progreso
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      final now = DateTime.now();
      final seconds = now.second;

      // Calculamos el ciclo de 30 segundos
      final int remain = 30 - (seconds % 30);

      setState(() {
        _progress = remain / 30.0;
      });

      // Refrescamos el código (el provider decide si cambia o no)
      ref.read(totpProvider.notifier).generateOtp();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Escuchamos el estado del provider
    final state = ref.watch(totpProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Token Digital',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tu clave dinámica es:',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // EL TOKEN
            Text(
              state.otp.isEmpty ? '--- ---' : _formatOtp(state.otp),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Color(0xFFD32F2F), // Rojo OH
              ),
            ),

            const SizedBox(height: 40),

            // EL RELOJ
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: _progress,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blue,
                    ),
                  ),
                ),
                Text(
                  '${(30 * _progress).toInt()}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatOtp(String otp) {
    if (otp.length != 6) return otp;
    return "${otp.substring(0, 3)} ${otp.substring(3)}";
  }
}
