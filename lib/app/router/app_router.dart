import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_boilerplate/app/core/data/datasources/local/local_datasources.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/iconsax.dart';
import 'package:test_boilerplate/app/core/ui_components/templates/not_found_page.dart';
import 'package:test_boilerplate/app/di.dart';
import 'package:test_boilerplate/app/router/base_route.dart';
import 'package:test_boilerplate/features/authentication/router/router.dart' as auth_router;
import 'package:test_boilerplate/features/dashboard/presentation/viewmodel/home_viewmodel.dart';
import 'package:test_boilerplate/features/dashboard/router/router.dart' as dash_router;

import 'utils/khonic_shell_route.dart';

part 'route_config.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Home Navigator",
);
final _profileNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Notif Navigator",
);
final isNavbarVisible = ValueNotifier<bool>(true);

class AppRouter {
  get router => _router;
  late final GoRouter _router;
  final List<NavigatorObserver>? routerObservers;

  //  not authenticated route
  final _unAuthenticateRoute = [
    auth_router.RouteConfig.login,
    auth_router.RouteConfig.forgotPassword,
    auth_router.RouteConfig.resetPassword,
  ];

  /// Whether the router is in slicing mode or not.
  /// to disable the authentication procedure.
  final bool isSlicingMode;
  AppRouter({
    required SessionDatasources datasources,
    this.routerObservers,
    this.isSlicingMode = false,
  }) {
    final featureRoute = KhonicShellRoute(
      providers: [
        KhonicProvider(
          create: (_) => locator.get<HomeViewmodel>(),
        ),
      ],
      branches: [
        KhonicShellBranch(
          navigatorKey: _homeNavigatorKey,
          icon: Iconsax.home,
          activeIcon: Iconsax.home25,
          title: "Beranda",
          routes: [
            dash_router.routes,
          ],
        ),
        KhonicShellBranch(
          navigatorKey: _profileNavigatorKey,
          activeIcon: Icons.person,
          icon: Icons.person_outline,
          title: "Profile",
          routes: [
            auth_router.profileRoutes,
          ],
        ),
      ],
    );
    _router = GoRouter(
      observers: routerObservers,
      debugLogDiagnostics: kDebugMode,
      navigatorKey: _rootNavigatorKey,
      refreshListenable: isSlicingMode ? null : datasources.listenableSession,
      initialLocation: isSlicingMode ? dash_router.RouteConfig.home : auth_router.RouteConfig.login,
      routes: [
        featureRoute.build(),
        auth_router.routes,
      ],

      /// This is the default page that will be shown when the route is not found.
      errorBuilder: (context, state) => const NotFoundPage(),

      /// this is redirect function to redirect user to login page if user not logged in
      redirect: isSlicingMode
          ? null
          : (context, state) {
              final savedSession = datasources.getSession();
              if ((state.fullPath?.contains(auth_router.RouteConfig.login) ?? false) && savedSession != null) {
                return dash_router.RouteConfig.home;
              } else if (!_unAuthenticateRoute.contains(state.fullPath) && savedSession == null) {
                return auth_router.RouteConfig.login;
              }
              return null;
            },
    );
  }
}
