import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'app/core/ui_components/themes/color_pallete.dart';
import 'app/di.dart';
import 'app/router/app_router.dart';
import 'features/authentication/presentation/viewmodel/auth_viewmodel.dart';
import 'flavors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => locator.get<AuthViewmodel>(),
        ),
        Provider(
          create: (context) => locator.get<AppRouter>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final GoRouter router = Provider.of<AppRouter>(context).router;
          return MaterialApp.router(
            title: F.title,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: ColorPallete.primaryBlue.color,
              ).copyWith(),
              dialogBackgroundColor: ColorPallete.paper.color,
              dialogTheme: DialogTheme(
                backgroundColor: ColorPallete.paper.color,
                surfaceTintColor: ColorPallete.paper.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              cardColor: ColorPallete.whiteSwan.color,
              useMaterial3: true,
            ),
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
