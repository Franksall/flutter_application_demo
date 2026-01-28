import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_demo/core/constants/app_colors.dart';
import 'package:flutter_application_demo/core/constants/app_constants.dart';
import 'package:flutter_application_demo/core/utils/formatters.dart';
import 'package:flutter_application_demo/core/widgets/confirmation_dialog.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/document_entity.dart';
import 'package:flutter_application_demo/features/documents/presentation/providers/documents_provider.dart';
import 'package:flutter_application_demo/features/documents/presentation/providers/documents_state.dart';
import 'package:flutter_application_demo/features/documents/presentation/widgets/app_drawer.dart';
import 'package:flutter_application_demo/features/documents/presentation/widgets/document_card.dart';
import 'package:flutter_application_demo/features/token_digital/presentation/pages/token_digital_page.dart';
import 'package:flutter_application_demo/core/di/injection.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';

class DocumentsPage extends ConsumerStatefulWidget {
  const DocumentsPage({super.key});

  @override
  ConsumerState<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends ConsumerState<DocumentsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(documentsProvider.notifier).loadPendingDocuments();
    });
  }

  void _showDocumentDetail(DocumentEntity document) {
    // Cargar el detalle desde la API
    ref.read(documentsProvider.notifier).loadDocumentDetail(document.id);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _DocumentDetailSheet(documentId: document.id),
    ).whenComplete(() {
      // Limpiar el detalle cuando se cierra el modal
      ref.read(documentsProvider.notifier).clearDocumentDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(documentsProvider);
    final selectedIndex = state.selectedTabIndex;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedIndex == 0
              ? 'Pendientes (${state.pendingPagination.totalItems})'
              : selectedIndex == 1
              ? 'Aprobados (${state.approvedPagination.totalItems})'
              : 'Token digital',
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: AppDrawer(
        userName: 'Juan Carlos Miranda',
        onLogout: () async {
          Navigator.of(context).pop();
          try {
            await getIt<AuthRepository>().logout();
          } catch (e) {
            debugPrint("Error al avisar a Python: $e");
          }
          if (context.mounted) {
            context.go(AppConstants.loginRoute);
          }
        },
      ),
      body: selectedIndex == 2
          ? const TokenDigitalPage()
          : state.status == DocumentsStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : state.status == DocumentsStatus.error
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage ?? 'Error al cargar documentos',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedIndex == 0) {
                        ref
                            .read(documentsProvider.notifier)
                            .loadPendingDocuments();
                      } else {
                        ref
                            .read(documentsProvider.notifier)
                            .loadApprovedDocuments();
                      }
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            )
          : _buildDocumentsList(
              selectedIndex == 0
                  ? state.pendingDocuments
                  : state.approvedDocuments,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(documentsProvider.notifier).setTabIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Pendientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Aprobados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gpp_good_outlined),
            label: 'Token digital',
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsList(List<DocumentEntity> documents) {
    final state = ref.watch(documentsProvider);
    final selectedIndex = state.selectedTabIndex;

    if (documents.isEmpty && state.status != DocumentsStatus.loading) {
      return Container(
        color: const Color(0x33D9D9D9),
        child: Center(
          child: Text(
            'No hay documentos',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    final hasMore = selectedIndex == 0
        ? state.pendingPagination.hasNext
        : state.approvedPagination.hasNext;

    final isLoadingMore = state.status == DocumentsStatus.loadingMore;

    return Container(
      color: const Color(0x33D9D9D9),
      child: RefreshIndicator(
        onRefresh: () async {
          if (selectedIndex == 0) {
            await ref.read(documentsProvider.notifier).loadPendingDocuments();
          } else {
            await ref.read(documentsProvider.notifier).loadApprovedDocuments();
          }
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: documents.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            // Si es el último item y hay más páginas, mostrar loading y cargar más
            if (index == documents.length) {
              if (!isLoadingMore) {
                // Cargar más documentos cuando se alcanza el final
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (selectedIndex == 0) {
                    ref
                        .read(documentsProvider.notifier)
                        .loadMorePendingDocuments();
                  } else {
                    ref
                        .read(documentsProvider.notifier)
                        .loadMoreApprovedDocuments();
                  }
                });
              }

              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final document = documents[index];
            return DocumentCard(
              document: document,
              onTap: () => _showDocumentDetail(document),
            );
          },
        ),
      ),
    );
  }
}

class _DocumentDetailSheet extends ConsumerWidget {
  final String documentId;

  const _DocumentDetailSheet({required this.documentId});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(documentsProvider);
    final detailStatus = state.detailStatus;
    final detail = state.selectedDocumentDetail;

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(24),
          child: _buildContent(context, ref, detailStatus, detail),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    DetailStatus detailStatus,
    dynamic detail,
  ) {
    // Loading state
    if (detailStatus == DetailStatus.loading) {
      return Column(
        children: [
          _buildHeader(context),
          const Expanded(child: Center(child: CircularProgressIndicator())),
        ],
      );
    }

    // Error state
    if (detailStatus == DetailStatus.error) {
      final state = ref.read(documentsProvider);
      return Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.detailErrorMessage ?? 'Error al cargar el detalle',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(documentsProvider.notifier)
                          .loadDocumentDetail(documentId);
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // Success state - Show detail
    if (detail == null) {
      return Column(
        children: [
          _buildHeader(context),
          const Expanded(
            child: Center(child: Text('No se encontró el detalle')),
          ),
        ],
      );
    }

    final currencySymbol = _getCurrencySymbol(detail.currency);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              detail.operationDate,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          detail.operationName,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (detail.beneficiaryName != null)
          Text(
            detail.beneficiaryName!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(
                  context,
                  'Tipo de operación:',
                  detail.transferType,
                ),
                _buildDetailRow(
                  context,
                  'Cuenta origen:',
                  detail.sourceAccountNumber,
                ),
                if (detail.destinationAccountNumber != null)
                  _buildDetailRow(
                    context,
                    'Cuenta destino:',
                    detail.destinationAccountNumber!,
                  ),
                _buildDetailRow(context, 'Moneda:', detail.currency),
                _buildDetailRow(
                  context,
                  'Monto:',
                  '$currencySymbol ${Formatters.formatCurrency(detail.amount).replaceAll(RegExp(r'^[^\d]*'), '')}',
                ),
                const SizedBox(height: 16),
                _buildApprovalLevelsSection(context, detail),
                const SizedBox(height: 16),
                if (detail.approvals.isNotEmpty)
                  _buildApprovalsSection(context, detail.approvals),
              ],
            ),
          ),
        ),
        if (detail.status == 'PENDING') ...[
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ConfirmationDialog.show(
                      context: context,
                      title: 'Confirmar acción',
                      message:
                          '¿Estás seguro que deseas aprobar esta operación?',
                      onConfirm: () {
                        ref
                            .read(documentsProvider.notifier)
                            .approveDocument(documentId);
                      },
                    );
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Aprobar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ConfirmationDialog.show(
                      context: context,
                      title: 'Confirmar acción',
                      message:
                          '¿Estás seguro que deseas rechazar esta operación?',
                      onConfirm: () {
                        ref
                            .read(documentsProvider.notifier)
                            .approveDocument(documentId);
                      },
                    );
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('Rechazar'),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildApprovalLevelsSection(BuildContext context, dynamic detail) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Niveles de aprobación',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Nivel actual: ${detail.currentApprovalLevel} de ${detail.approvalLevelsRequired}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: detail.approvalLevelsRequired > 0
                      ? detail.currentApprovalLevel /
                            detail.approvalLevelsRequired
                      : 0,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildApprovalsSection(BuildContext context, List<dynamic> approvals) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historial de aprobaciones',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...approvals.map((approval) => _buildApprovalItem(context, approval)),
        ],
      ),
    );
  }

  Widget _buildApprovalItem(BuildContext context, dynamic approval) {
    final isApproved = approval.status == 'APPROVED';
    final isRejected = approval.status == 'REJECTED';

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            isApproved
                ? Icons.check_circle
                : isRejected
                ? Icons.cancel
                : Icons.pending,
            color: isApproved
                ? Colors.green
                : isRejected
                ? Colors.red
                : Colors.orange,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  approval.approvalName,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Nivel ${approval.approvalLevel} - ${approval.status}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
