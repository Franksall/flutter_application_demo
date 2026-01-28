import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

class CreatePasswordPage extends ConsumerStatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  ConsumerState<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends ConsumerState<CreatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpController = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  // Validaciones
  bool get _hasMinLength => _newPasswordController.text.length >= 8;
  bool get _hasUpperCase => _newPasswordController.text.contains(RegExp(r'[A-Z]'));
  bool get _hasLowerCase => _newPasswordController.text.contains(RegExp(r'[a-z]'));
  bool get _hasNumber => _newPasswordController.text.contains(RegExp(r'[0-9]'));
  bool get _hasSpecialChar => _newPasswordController.text.contains(RegExp(r'[@#$%^&*(),.?":{}|<>!]'));
  bool get _passwordsMatch => _newPasswordController.text == _confirmPasswordController.text && _confirmPasswordController.text.isNotEmpty;
  bool get _hasOtp => _otpController.text.isNotEmpty;

  bool get _allValidationsPassed => _hasMinLength && _hasUpperCase && _hasLowerCase && _hasNumber && _hasSpecialChar && _passwordsMatch && _hasOtp;

  String get _passwordStrength {
    int strength = 0;
    if (_hasMinLength) strength++;
    if (_hasUpperCase) strength++;
    if (_hasLowerCase) strength++;
    if (_hasNumber) strength++;
    if (_hasSpecialChar) strength++;

    if (strength >= 5) return 'Fuerte';
    if (strength >= 3) return 'Media';
    return 'Débil';
  }

  Color get _passwordStrengthColor {
    final strength = _passwordStrength;
    if (strength == 'Fuerte') return const Color(0xFF4CAF50);
    if (strength == 'Media') return const Color(0xFFFFA726);
    return const Color(0xFFF44336);
  }

  double get _passwordStrengthProgress {
    int strength = 0;
    if (_hasMinLength) strength++;
    if (_hasUpperCase) strength++;
    if (_hasLowerCase) strength++;
    if (_hasNumber) strength++;
    if (_hasSpecialChar) strength++;

    return strength / 5;
  }

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(() => setState(() {}));
    _confirmPasswordController.addListener(() => setState(() {}));
    _otpController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Steps
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStep(1, false),
                      Container(
                        width: 60,
                        height: 2,
                        color: AppColors.border,
                      ),
                      _buildStep(2, true),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Título
                  Text(
                    'Crear nueva contraseña',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F1F1F),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Campo nueva contraseña
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: _obscureNewPassword,
                    decoration: InputDecoration(
                      labelText: 'Nueva contraseña',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Indicador de seguridad
                  if (_newPasswordController.text.isNotEmpty) ...[
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: _passwordStrengthProgress,
                            backgroundColor: const Color(0xFFEEEEEE),
                            valueColor: AlwaysStoppedAnimation<Color>(_passwordStrengthColor),
                            minHeight: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Seguridad: ',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                        Text(
                          _passwordStrength,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: _passwordStrengthColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 16),

                  // Campo confirmar contraseña
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Campo OTP
                  TextFormField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Código OTP',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ingrese el código OTP que recibió en su correo electrónico asociado.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Lista de validaciones
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'La contraseña debe contener:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF1F1F1F),
                          ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildValidationItem('Mínimo 8 caracteres', _hasMinLength),
                  _buildValidationItem('Una letra mayúscula', _hasUpperCase),
                  _buildValidationItem('Una letra minúscula', _hasLowerCase),
                  _buildValidationItem('Un número', _hasNumber),
                  _buildValidationItem('Un carácter especial (@#\$%^&*)', _hasSpecialChar),
                  const SizedBox(height: 32),

                  // Botón
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _allValidationsPassed
                          ? () {
                              context.go(AppConstants.deviceEnrollmentRoute);
                            }
                          : null,
                      child: const Text('Establecer contraseña'),
                    ),
                  ),
                ],
              ),
            ),
          ),
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

  Widget _buildValidationItem(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isValid ? const Color(0xFF4CAF50) : Colors.transparent,
              border: Border.all(
                color: isValid ? const Color(0xFF4CAF50) : const Color(0xFFD9D9D9),
                width: 2,
              ),
            ),
            child: isValid
                ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isValid ? const Color(0xFF1F1F1F) : AppColors.textSecondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
