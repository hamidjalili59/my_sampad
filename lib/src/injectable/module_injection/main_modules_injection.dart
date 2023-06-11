import 'package:api_service/api_service.dart';
import 'package:database_service/database_service.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/core/interceptors/auth_header_suplier.dart';
import 'package:my_sampad/src/core/interceptors/request_interceptor.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';
import 'package:my_sampad/src/features/school/domain/models/principal.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

class MainModulesInjection {
  MainModulesInjection() {
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(
        interceptors: [getIt.get<RequestInterceptor>()],
        dio: getIt.get<Dio>(),
      ),
    );
    getIt.registerLazySingleton<DatabaseService>(
      () => DatabaseServiceImpl(),
    );
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
    getIt.registerLazySingleton<AuthHeaderSupplier>(() => AuthHeaderSupplier());
  }

  //
  Future initDatabase() async =>
      await getIt.get<DatabaseService>().initialize();

  Future registerHiveAdapters() async {
    final databaseService = getIt.get<DatabaseService>();
    databaseService.registerAdapter(OtpHandshakeResponseAdapter());
    databaseService.registerAdapter(ParentAdapter());
    databaseService.registerAdapter(TeacherAdapter());
    databaseService.registerAdapter(PrincipalAdapter());
    databaseService.registerAdapter(DeputyAdapter());
    databaseService.registerAdapter(BasicInfoModelAdapter());
  }
}
