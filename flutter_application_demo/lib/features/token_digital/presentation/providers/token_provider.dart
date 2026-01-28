import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_demo/features/token_digital/presentation/providers/token_state.dart';

class TokenNotifier extends StateNotifier<TokenState> {
  Timer? _timer;
  static const int tokenDuration = 30;

  TokenNotifier() : super(const TokenState()) {
    generateToken();
  }

  void generateToken() {
    // Cancelar el timer anterior si existe
    _timer?.cancel();

    // Generar un token aleatorio de 8 dígitos
    final random = Random();
    final token = List.generate(8, (_) => random.nextInt(10)).join();

    state = TokenState(
      token: token,
      remainingSeconds: tokenDuration,
      isGenerating: false,
    );

    // Iniciar el countdown
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        state = state.copyWith(
          remainingSeconds: state.remainingSeconds - 1,
        );
      } else {
        // Cuando llega a 0, generar un nuevo token automáticamente
        timer.cancel();
        generateToken();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final tokenProvider = StateNotifierProvider<TokenNotifier, TokenState>((ref) {
  return TokenNotifier();
});
