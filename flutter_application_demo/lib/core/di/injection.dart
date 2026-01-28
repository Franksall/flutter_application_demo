import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_demo/core/config/app_config.dart';
import 'package:flutter_application_demo/core/network/api_client.dart';
import 'package:flutter_application_demo/core/network/api_config.dart';

// Login
import 'package:flutter_application_demo/features/login/data/datasources/auth_local_datasource.dart';
import 'package:flutter_application_demo/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_application_demo/features/login/data/datasources/auth_mock_datasource.dart';
import 'package:flutter_application_demo/features/login/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_demo/features/login/domain/repositories/auth_repository.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/get_remembered_document_usecase.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_application_demo/features/login/domain/usecases/save_remember_document_usecase.dart';

// Documents
import 'package:flutter_application_demo/features/documents/data/datasources/documents_remote_datasource.dart';
import 'package:flutter_application_demo/features/documents/data/datasources/documents_api_datasource.dart';
import 'package:flutter_application_demo/features/documents/data/repositories/documents_repository_impl.dart';
import 'package:flutter_application_demo/features/documents/domain/repositories/documents_repository.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/approve_document_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/reject_document_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/get_pending_documents_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/get_approved_documents_usecase.dart';
import 'package:flutter_application_demo/features/documents/domain/usecases/get_document_detail_usecase.dart';
import 'package:flutter_application_demo/features/approvals/data/services/approval_operations_service.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);

  // Core
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // Registrar Dio para servicios que lo necesiten directamente
  getIt.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectionTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ));

  // Features
  await _configureLoginDependencies();
  await _configureDocumentsDependencies();
}

Future<void> _configureLoginDependencies() async {
  // Data sources - Se usa Mock o Real según configuración
  if (AppConfig.useMockData) {
    // Modo MOCK - Usa datos desde JSON
    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthMockDataSource(),
    );
  } else {
    // Modo PRODUCCIÓN - Usa API real
    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()),
    );
  }

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: getIt(),
      secureStorage: getIt(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveRememberDocumentUseCase(getIt()));
  getIt.registerLazySingleton(() => GetRememberedDocumentUseCase(getIt()));
}

Future<void> _configureDocumentsDependencies() async {
  // Registrar el servicio de aprobaciones
  getIt.registerLazySingleton<ApprovalOperationsService>(
    () => ApprovalOperationsService(getIt()),
  );

  // Data sources - Usa la API real
  getIt.registerLazySingleton<DocumentsRemoteDataSource>(
    () => DocumentsApiDataSource(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<DocumentsRepository>(
    () => DocumentsRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPendingDocumentsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetApprovedDocumentsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetDocumentDetailUseCase(getIt()));
  getIt.registerLazySingleton(() => ApproveDocumentUseCase(getIt()));
  getIt.registerLazySingleton(() => RejectDocumentUseCase(getIt()));
}
