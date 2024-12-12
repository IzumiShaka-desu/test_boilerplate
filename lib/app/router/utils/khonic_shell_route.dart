import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_boilerplate/app/common/extension/go_router_ext.dart';
import 'package:test_boilerplate/app/core/ui_components/templates/scaffold_with_navigation/nav_destination.dart';
import 'package:test_boilerplate/app/core/ui_components/templates/scaffold_with_navigation/scaffold_with_nested_navigation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'khonic_route.dart';

class KhonicShellBranch {
  final List<KhonicRoute> routes;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? initialLocation;
  final String? restorationScopeId;
  final List<NavigatorObserver>? observers;
  final String title;
  final IconData icon;
  final IconData? activeIcon;

  KhonicShellBranch({
    this.observers,
    this.activeIcon,
    this.navigatorKey,
    required this.icon,
    required this.title,
    required this.routes,
    this.initialLocation,
    this.restorationScopeId,
  });
}

class KhonicShellRoute {
  final List<KhonicShellBranch> branches;
  final List<SingleChildWidget> providers;
  final bool Function(String currentRoute)? navbarVisibilityFilter;

  KhonicShellRoute({
    required this.branches,
    required this.providers,
    this.navbarVisibilityFilter,
  });

  StatefulShellRoute build({
    ValueNotifier<bool>? isNavbarVisible,
  }) {
    return StatefulShellRoute.indexedStack(
      branches: branches
          .map(
            (branch) => StatefulShellBranch(
              routes: branch.routes,
              observers: branch.observers,
              navigatorKey: branch.navigatorKey,
              initialLocation: branch.initialLocation,
              restorationScopeId: branch.restorationScopeId,
            ),
          )
          .toList(),
      builder: (context, goRouterState, navigationShell) {
        bool? isVisible = true;
        final currentPath = GoRouter.of(context).location;
        if (navbarVisibilityFilter != null) {
          isVisible = navbarVisibilityFilter!(currentPath);
        } else {
          isVisible = branches.any((branch) {
            if (branch.initialLocation != null) {
              return currentPath == branch.initialLocation;
            }
            return branch.routes.firstOrNull?.path == currentPath;
          });
        }

        final child = ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
          isNavbarVisible: isVisible,
          destinations: branches
              .map(
                (branch) => NavDestination(
                  title: branch.title,
                  icon: branch.icon,
                  activeIcon: branch.activeIcon,
                ),
              )
              .toList(),
        );
        if (providers.isNotEmpty) {
          return MultiProvider(
            providers: providers,
            builder: (context, _) => child,
          );
        }
        return child;
      },
    );
  }
}
