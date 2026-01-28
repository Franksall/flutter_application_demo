import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_response_model.dart';
import 'operation_model.dart';

part 'list_operations_response_model.freezed.dart';
part 'list_operations_response_model.g.dart';

/// Datos de respuesta para listar operaciones
@freezed
class BsListOperationsResponseData with _$BsListOperationsResponseData {
  const factory BsListOperationsResponseData({
    required List<BsOperationSummary> operations,
    required PaginationInfo pagination,
  }) = _BsListOperationsResponseData;

  factory BsListOperationsResponseData.fromJson(Map<String, dynamic> json) =>
      _$BsListOperationsResponseDataFromJson(json);
}

/// Respuesta completa para listar operaciones
@freezed
class BsListOperationsResponse with _$BsListOperationsResponse {
  const factory BsListOperationsResponse({
    required bool success,
    required String message,
    BsListOperationsResponseData? data,
  }) = _BsListOperationsResponse;

  factory BsListOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$BsListOperationsResponseFromJson(json);
}
