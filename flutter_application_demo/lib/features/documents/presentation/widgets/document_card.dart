import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/document_entity.dart';

class DocumentCard extends StatefulWidget {
  final DocumentEntity document;
  final VoidCallback? onTap;

  const DocumentCard({
    super.key,
    required this.document,
    this.onTap,
  });

  @override
  State<DocumentCard> createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  bool _isFocused = false;

  /// Retorna el símbolo de moneda según el código
  String _getCurrencySymbol(String currency) {
    switch (currency.toUpperCase()) {
      case 'PEN':
        return 'S/';
      case 'USD':
        return '\$';
      default:
        return currency;
    }
  }

  /// Formatea el monto sin símbolo de moneda
  String _formatAmount(double amount) {
    final formatter = NumberFormat('#,##0.00', 'es_PE');
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final currencySymbol = _getCurrencySymbol(widget.document.currency);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: _isFocused ? const Color(0xFFB3ECFF) : Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: widget.onTap,
          onTapDown: (_) => setState(() => _isFocused = true),
          onTapUp: (_) => setState(() => _isFocused = false),
          onTapCancel: () => setState(() => _isFocused = false),
          onFocusChange: (focused) => setState(() => _isFocused = focused),
          borderRadius: BorderRadius.circular(12),
          highlightColor: const Color(0xFFB3ECFF),
          splashColor: const Color(0xFFB3ECFF).withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título y fecha de operación
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.document.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.document.operationDate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tipo
                _buildInfoRow(
                  context,
                  'Tipo:',
                  widget.document.type,
                ),
                const SizedBox(height: 8),

                // Origen
                if (widget.document.sourceAccount != null) ...[
                  _buildInfoRow(
                    context,
                    'Origen:',
                    widget.document.sourceAccount!.accountNumber,
                  ),
                  const SizedBox(height: 8),
                ],

                // Destino (beneficiario + cuenta)
                if (widget.document.destinationAccount != null) ...[
                  _buildDestinationInfo(context),
                  const SizedBox(height: 8),
                ],

                // Monto
                _buildInfoRow(
                  context,
                  'Monto:',
                  '$currencySymbol ${_formatAmount(widget.document.amount)}',
                ),

                // Comisión
                if (widget.document.commission != null) ...[
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    context,
                    'Comisión:',
                    '$currencySymbol ${_formatAmount(widget.document.commission!)}',
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDestinationInfo(BuildContext context) {
    final destination = widget.document.destinationAccount!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Destino:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (destination.beneficiaryName != null)
                Text(
                  destination.beneficiaryName!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              if (destination.accountNumber != null)
                Text(
                  destination.accountNumber!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
