import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:otp/otp.dart'; //  (v3.1.0)
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/resources/data_state.dart';
import '../../domain/entities/totp_entity.dart';
import '../../data/repositories/impl/totp_repository_impl.dart';
import '../../domain/usecases/get_secret_use_case.dart';
import '../../domain/usecases/validate_otp_use_case.dart';

// 1. ESTADO
class TotpState {
  final String otp;
  final String secret;
  final List<TotpEntity> history;
  final bool? isValid;

  TotpState({
    this.otp = '',
    this.secret = '',
    this.history = const [],
    this.isValid,
  });

  TotpState copyWith({
    String? otp,
    String? secret,
    List<TotpEntity>? history,
    bool? isValid,
  }) {
    return TotpState(
      otp: otp ?? this.otp,
      secret: secret ?? this.secret,
      history: history ?? this.history,
      isValid: isValid ?? this.isValid,
    );
  }
}

// NOTIFIER (Lógica adaptada a la librería 'otp')
class TotpNotifier extends StateNotifier<TotpState> {
  final GetSecretUseCase _getSecretUseCase;

  // Configuración estándar
  final int _interval = 30;
  final Algorithm _algorithm = Algorithm.SHA256;

  TotpNotifier(this._getSecretUseCase) : super(TotpState());

  Future<void> initializeOtp() async {
    final secretResult = await _getSecretUseCase.call();

    if (secretResult is DataSuccess && secretResult.data != null) {
      state = state.copyWith(secret: secretResult.data!);
      generateOtp();
    }
  }

  void generateOtp() {
    // Si no hay secret o el widget se cerró, no hacemos nada
    if (!mounted || state.secret.isEmpty) return;

    final time = DateTime.now();
    final timeMillis = time.millisecondsSinceEpoch;

    try {
      //  librería 'otp' ^3.1.0
      final newOtp = OTP.generateTOTPCodeString(
        state.secret,
        timeMillis,
        algorithm: _algorithm,
        interval: _interval,
        isGoogle: true,
      );

      final entity = TotpEntity(
        dateTime: time,
        formattedDateTime: DateFormat('HH:mm:ss').format(time),
        otp: newOtp,
      );

      state = state.copyWith(otp: newOtp, history: [entity, ...state.history]);
    } catch (e) {
      print("Error generando OTP: $e");
    }
  }
}

// INYECCIÓN DE DEPENDENCIAS (Wiring)
final totpRepositoryProvider = Provider(
  (ref) => TotpRepositoryImpl(ApiClient()),
);
final storageProvider = Provider((ref) => const FlutterSecureStorage());

// Caso de Uso
final getSecretUseCaseProvider = Provider(
  (ref) => GetSecretUseCase(
    ref.read(totpRepositoryProvider),
    ref.read(storageProvider),
  ),
);

// PROVIDER QUE USA LA PANTALLA
final totpProvider = StateNotifierProvider<TotpNotifier, TotpState>((ref) {
  return TotpNotifier(ref.read(getSecretUseCaseProvider));
});
