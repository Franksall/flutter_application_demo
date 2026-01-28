import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

/// Estructura estándar de respuesta para todas las APIs
@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    required String message,
    T? data,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

/// Estructura de error estándar
@freezed
class ApiErrorItem with _$ApiErrorItem {
  const factory ApiErrorItem({
    required String code,
    required String message,
    String? field,
  }) = _ApiErrorItem;

  factory ApiErrorItem.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorItemFromJson(json);
}

/// Información de paginación estándar
@freezed
class PaginationInfo with _$PaginationInfo {
  const factory PaginationInfo({
    required int page,
    required int limit,
    required int total,
    required int pages,
    bool? hasNext,
    bool? hasPrevious,
  }) = _PaginationInfo;

  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);
}
