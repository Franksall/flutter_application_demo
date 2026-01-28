import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_demo/core/di/injection.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/approve_document_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/reject_document_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/get_pending_documents_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/get_approved_documents_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/get_document_detail_usecase.dart';
import 'package:flutter_application_demo/features/documents/presentation/providers/documents_state.dart';

final documentsProvider =
    StateNotifierProvider<DocumentsNotifier, DocumentsState>((ref) {
  return DocumentsNotifier(
    getPendingDocumentsUseCase: getIt<GetPendingDocumentsUseCase>(),
    getApprovedDocumentsUseCase: getIt<GetApprovedDocumentsUseCase>(),
    getDocumentDetailUseCase: getIt<GetDocumentDetailUseCase>(),
    approveDocumentUseCase: getIt<ApproveDocumentUseCase>(),
    rejectDocumentUseCase: getIt<RejectDocumentUseCase>(),
  );
});

class DocumentsNotifier extends StateNotifier<DocumentsState> {
  final GetPendingDocumentsUseCase getPendingDocumentsUseCase;
  final GetApprovedDocumentsUseCase getApprovedDocumentsUseCase;
  final GetDocumentDetailUseCase getDocumentDetailUseCase;
  final ApproveDocumentUseCase approveDocumentUseCase;
  final RejectDocumentUseCase rejectDocumentUseCase;

  DocumentsNotifier({
    required this.getPendingDocumentsUseCase,
    required this.getApprovedDocumentsUseCase,
    required this.getDocumentDetailUseCase,
    required this.approveDocumentUseCase,
    required this.rejectDocumentUseCase,
  }) : super(const DocumentsState());

  Future<void> loadPendingDocuments({bool reset = true}) async {
    if (reset) {
      state = state.copyWith(
        status: DocumentsStatus.loading,
        errorMessage: null,
        pendingDocuments: [],
        pendingPagination: const PaginationInfo(),
      );
    } else {
      state = state.copyWith(
        status: DocumentsStatus.loadingMore,
        errorMessage: null,
      );
    }

    final page = reset ? 1 : state.pendingPagination.currentPage + 1;
    final result = await getPendingDocumentsUseCase(page: page, limit: 20);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: DocumentsStatus.error,
          errorMessage: failure.message,
        );
      },
      (response) {
        final updatedDocuments = reset
            ? response.documents
            : [...state.pendingDocuments, ...response.documents];

        final pagination = PaginationInfo(
          currentPage: response.pagination.page,
          totalPages: response.pagination.pages,
          totalItems: response.pagination.total,
          hasNext: response.pagination.hasNext,
          hasPrevious: response.pagination.hasPrevious,
        );

        state = state.copyWith(
          status: DocumentsStatus.success,
          pendingDocuments: updatedDocuments,
          pendingPagination: pagination,
        );
      },
    );
  }

  Future<void> loadApprovedDocuments({bool reset = true}) async {
    if (reset) {
      state = state.copyWith(
        status: DocumentsStatus.loading,
        errorMessage: null,
        approvedDocuments: [],
        approvedPagination: const PaginationInfo(),
      );
    } else {
      state = state.copyWith(
        status: DocumentsStatus.loadingMore,
        errorMessage: null,
      );
    }

    final page = reset ? 1 : state.approvedPagination.currentPage + 1;
    final result = await getApprovedDocumentsUseCase(page: page, limit: 20);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: DocumentsStatus.error,
          errorMessage: failure.message,
        );
      },
      (response) {
        final updatedDocuments = reset
            ? response.documents
            : [...state.approvedDocuments, ...response.documents];

        final pagination = PaginationInfo(
          currentPage: response.pagination.page,
          totalPages: response.pagination.pages,
          totalItems: response.pagination.total,
          hasNext: response.pagination.hasNext,
          hasPrevious: response.pagination.hasPrevious,
        );

        state = state.copyWith(
          status: DocumentsStatus.success,
          approvedDocuments: updatedDocuments,
          approvedPagination: pagination,
        );
      },
    );
  }

  Future<void> loadMorePendingDocuments() async {
    if (state.pendingPagination.hasNext && state.status != DocumentsStatus.loadingMore) {
      await loadPendingDocuments(reset: false);
    }
  }

  Future<void> loadMoreApprovedDocuments() async {
    if (state.approvedPagination.hasNext && state.status != DocumentsStatus.loadingMore) {
      await loadApprovedDocuments(reset: false);
    }
  }

  Future<void> approveDocument(String documentId) async {
    final result = await approveDocumentUseCase(documentId);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: DocumentsStatus.error,
          errorMessage: failure.message,
        );
      },
      (_) {
        final updatedPending = state.pendingDocuments
            .where((doc) => doc.id != documentId)
            .toList();

        state = state.copyWith(
          pendingDocuments: updatedPending,
        );

        loadPendingDocuments();
      },
    );
  }

  Future<void> rejectDocument(String documentId) async {
    final result = await rejectDocumentUseCase(documentId);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: DocumentsStatus.error,
          errorMessage: failure.message,
        );
      },
      (_) {
        final updatedPending = state.pendingDocuments
            .where((doc) => doc.id != documentId)
            .toList();

        state = state.copyWith(
          pendingDocuments: updatedPending,
        );

        loadPendingDocuments();
      },
    );
  }

  void setTabIndex(int index) {
    state = state.copyWith(selectedTabIndex: index);

    // Siempre cargar los documentos al cambiar de tab
    if (index == 0) {
      loadPendingDocuments();
    } else if (index == 1) {
      loadApprovedDocuments();
    }
  }

  Future<void> loadDocumentDetail(String documentId) async {
    state = state.copyWith(
      detailStatus: DetailStatus.loading,
      detailErrorMessage: null,
      clearDetail: true,
    );

    final result = await getDocumentDetailUseCase(documentId);

    result.fold(
      (failure) {
        state = state.copyWith(
          detailStatus: DetailStatus.error,
          detailErrorMessage: failure.message,
        );
      },
      (detail) {
        state = state.copyWith(
          detailStatus: DetailStatus.success,
          selectedDocumentDetail: detail,
        );
      },
    );
  }

  void clearDocumentDetail() {
    state = state.copyWith(
      detailStatus: DetailStatus.initial,
      clearDetail: true,
      detailErrorMessage: null,
    );
  }
}
