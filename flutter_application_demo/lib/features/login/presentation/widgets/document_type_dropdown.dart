import 'package:flutter/material.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';

class DocumentTypeDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const DocumentTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: const InputDecoration(
        labelText: 'Documento de identidad',
      ),
      isExpanded: true,
      menuMaxHeight: 300,
      items: const [
        DropdownMenuItem(
          value: AppConstants.dniType,
          child: Text(
            AppConstants.dniType,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: AppConstants.ceType,
          child: Text(
            'CE (Carné de Extranjería)',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: AppConstants.passportType,
          child: Text(
            AppConstants.passportType,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
