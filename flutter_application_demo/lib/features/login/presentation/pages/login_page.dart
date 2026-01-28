import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/core/utils/validators.dart';
import 'package:flutter_application_demo/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_application_demo/features/login/presentation/widgets/document_type_dropdown.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _documentNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(loginProvider);
      if (state.documentNumber.isNotEmpty) {
        _documentNumberController.text = state.documentNumber;
      }
    });
  }

  @override
  void dispose() {
    _documentNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(loginProvider.notifier).login(_passwordController.text);
      context.go(AppConstants.loginLoadingRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'logo-oh.svg',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Iniciar sesión',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  DocumentTypeDropdown(
                    value: state.documentType,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(loginProvider.notifier).setDocumentType(value);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _documentNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Número de documento',
                      hintText: '87654321',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) => Validators.validateDocumentNumber(
                      value,
                      state.documentType,
                    ),
                    onChanged: (value) {
                      ref.read(loginProvider.notifier).setDocumentNumber(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: state.rememberDocument,
                        onChanged: (value) {
                          ref
                              .read(loginProvider.notifier)
                              .setRememberDocument(value ?? false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Recordar número de documento',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _handleLogin,
                    child: const Text('Ingresar'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      context.go(AppConstants.identityVerificationRoute);
                    },
                    child: const Text('Recuperar contraseña'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
