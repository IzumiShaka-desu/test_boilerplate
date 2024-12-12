// main.dart or core/service_locator.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_boilerplate/features/dashboard/injection.dart';
import '../features/authentication/injection.dart';
import 'core/data/models/session_model.dart';
import 'core/injection.dart';

final locator = GetIt.I;

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SavedSessionAdapter());

  await Hive.openBox<SavedSession>('session');
  initCoreDependencies(locator);
  initAuthDependencies(locator);
  initDashDependencies(locator);

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..boxShadow = []
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorWidget = const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(
          color: Colors.white,
          radius: 24,
        ),
      ],
    )
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black.withOpacity(0.5)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.black.withOpacity(0.5);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      // statusBarBrightness: Brightness.dark, // Dark text for status bar
    ),
  );
}
