import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

class IdentityVerificationPage extends ConsumerStatefulWidget {
  const IdentityVerificationPage({super.key});

  @override
  ConsumerState<IdentityVerificationPage> createState() =>
      _IdentityVerificationPageState();
}

class _IdentityVerificationPageState
    extends ConsumerState<IdentityVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _documentNumberController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedDocumentType = 'DNI';

  @override
  void dispose() {
    _documentNumberController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Volver al login',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
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
                      _buildStep(1, true),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.border,
                      ),
                      _buildStep(2, false),
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
                    'Verificación de identidad',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F1F1F),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ingresa tu documento de identidad y número de celular para continuar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Campo tipo de documento
                  DropdownButtonFormField<String>(
                    value: _selectedDocumentType,
                    decoration: const InputDecoration(
                      labelText: 'Documento de identidad',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'DNI', child: Text('DNI')),
                      DropdownMenuItem(value: 'CE', child: Text('CE')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedDocumentType = value;
                          _documentNumberController.clear();
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo número de documento
                  TextFormField(
                    controller: _documentNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: _selectedDocumentType == 'DNI'
                        ? [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ]
                        : [
                            LengthLimitingTextInputFormatter(12),
                          ],
                    decoration: const InputDecoration(
                      labelText: 'Número de documento',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu número de documento';
                      }
                      if (_selectedDocumentType == 'DNI' && value.length != 8) {
                        return 'El DNI debe tener 8 dígitos';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo número de celular
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Número de celular',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu número de celular';
                      }
                      if (value.length != 9) {
                        return 'El número debe tener 9 dígitos';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Botón
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.go(AppConstants.identityValidationRoute);
                        }
                      },
                      child: const Text('Continuar'),
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
}
