import 'package:get_it/get_it.dart';

import 'presentation/viewmodel/home_viewmodel.dart';

void initDashDependencies(GetIt locator) {
  // Viewmodels

  locator.registerFactory<HomeViewmodel>(
    () => HomeViewmodel(),
  );
}
