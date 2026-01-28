import 'package:flutter_application_demo/features/documents/domain/entities/document_entity.dart';
import 'package:flutter_application_demo/features/documents/domain/entities/document_detail_entity.dart';

enum DocumentsStatus { initial, loading, success, error, loadingMore }

enum DetailStatus { initial, loading, success, error }

class PaginationInfo {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNext;
  final bool hasPrevious;

  const PaginationInfo({
    this.currentPage = 1,
    this.totalPages = 1,
    this.totalItems = 0,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  PaginationInfo copyWith({
    int? currentPage,
    int? totalPages,
    int? totalItems,
    bool? hasNext,
    bool? hasPrevious,
  }) {
    return PaginationInfo(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      hasNext: hasNext ?? this.hasNext,
      hasPrevious: hasPrevious ?? this.hasPrevious,
    );
  }
}

class DocumentsState {
  final DocumentsStatus status;
  final List<DocumentEntity> pendingDocuments;
  final List<DocumentEntity> approvedDocuments;
  final String? errorMessage;
  final int selectedTabIndex;
  final PaginationInfo pendingPagination;
  final PaginationInfo approvedPagination;
  final DetailStatus detailStatus;
  final DocumentDetailEntity? selectedDocumentDetail;
  final String? detailErrorMessage;

  const DocumentsState({
    this.status = DocumentsStatus.initial,
    this.pendingDocuments = const [],
    this.approvedDocuments = const [],
    this.errorMessage,
    this.selectedTabIndex = 0,
    this.pendingPagination = const PaginationInfo(),
    this.approvedPagination = const PaginationInfo(),
    this.detailStatus = DetailStatus.initial,
    this.selectedDocumentDetail,
    this.detailErrorMessage,
  });

  DocumentsState copyWith({
    DocumentsStatus? status,
    List<DocumentEntity>? pendingDocuments,
    List<DocumentEntity>? approvedDocuments,
    String? errorMessage,
    int? selectedTabIndex,
    PaginationInfo? pendingPagination,
    PaginationInfo? approvedPagination,
    DetailStatus? detailStatus,
    DocumentDetailEntity? selectedDocumentDetail,
    String? detailErrorMessage,
    bool clearDetail = false,
  }) {
    return DocumentsState(
      status: status ?? this.status,
      pendingDocuments: pendingDocuments ?? this.pendingDocuments,
      approvedDocuments: approvedDocuments ?? this.approvedDocuments,
      errorMessage: errorMessage,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      pendingPagination: pendingPagination ?? this.pendingPagination,
      approvedPagination: approvedPagination ?? this.approvedPagination,
      detailStatus: detailStatus ?? this.detailStatus,
      selectedDocumentDetail: clearDetail ? null : (selectedDocumentDetail ?? this.selectedDocumentDetail),
      detailErrorMessage: detailErrorMessage,
    );
  }
}
