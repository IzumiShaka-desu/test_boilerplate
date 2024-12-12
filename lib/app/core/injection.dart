import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_boilerplate/app/app_config.dart';
import 'package:test_boilerplate/app/common/enum/app_version.dart';
import 'package:test_boilerplate/app/common/utils/networking/base_client.dart';
import 'package:test_boilerplate/app/common/utils/networking/auth_interceptors.dart';
import 'package:test_boilerplate/app/common/utils/networking/interceptors.dart';
import '../router/app_router.dart';
import 'data/datasources/local/local_datasources.dart';
import 'data/models/session_model.dart';

void initCoreDependencies(GetIt locator) {
  locator.registerSingleton<Box<SavedSession>>(
    Hive.box<SavedSession>('session'),
  );

  // Datasources
  locator.registerSingleton<SessionDatasources>(
    SessionDatasources(
      box: locator.get(),
    ),
  );

  // Services
  locator.registerSingleton<AppRouter>(
    AppRouter(
      isSlicingMode: false,
      datasources: locator(),
    ),
  );
  locator.registerSingleton<AuthInterceptors>(
    AuthInterceptors(
      sessionDatasources: locator(),
    ),
  );

  locator.registerSingleton<Dio>(
    KhonicClient(
      baseUrl: AppConfig.baseUrl,
      interceptors: [
        if (AppConfig.appVersion == AppVersion.dev) LogInterceptor(responseBody: true),
        ErrorInterceptor(),
        locator.get<AuthInterceptors>(),
      ],
    ),
  );
}
