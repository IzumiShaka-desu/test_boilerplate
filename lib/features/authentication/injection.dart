import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote_auth_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/usecases/authentication_usecases.dart';
import 'presentation/viewmodel/auth_viewmodel.dart';

void initAuthDependencies(GetIt locator) {
  // Datasources
  locator.registerLazySingleton<RemoteAuthDatasource>(
    () => RemoteAuthDatasource(
      client: locator.get<Dio>(),
    ),
  );

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDatasource: locator(),
      sessionDatasources: locator(),
    ),
  );

  // Usecases
  locator.registerLazySingleton<AuthUsecases>(
    () => AuthUsecases(
      repository: locator(),
    ),
  );

  // Viewmodels
  locator.registerLazySingleton<AuthViewmodel>(
    () => AuthViewmodel(
      usecases: locator(),
    ),
  );
}
