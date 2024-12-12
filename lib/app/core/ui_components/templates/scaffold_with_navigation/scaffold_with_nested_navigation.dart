// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'nav_destination.dart';
import 'scaffold_with_navigation_bar.dart';
import 'scaffold_with_navigation_rail.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final List<NavDestination> destinations;

  final bool isNavbarVisible;
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
    this.isNavbarVisible = true,
    required this.destinations,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
          isNavbarVisible: isNavbarVisible,
          destinations: destinations,
        );
      } else {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
          destinations: destinations,
        );
      }
    });
  }
}
