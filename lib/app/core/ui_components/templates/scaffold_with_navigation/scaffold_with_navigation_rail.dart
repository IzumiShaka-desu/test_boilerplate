import 'package:flutter/material.dart';

import 'nav_destination.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Fixed navigation rail on the left (start)
          NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              labelType: NavigationRailLabelType.all,
              destinations: destinations.map(
                (destination) {
                  return NavigationRailDestination(
                    icon: Icon(destination.icon),
                    label: Text(destination.title),
                    selectedIcon:
                        destination.activeIcon != null ? Icon(destination.activeIcon) : Icon(destination.icon),
                  );
                },
              ).toList()),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content on the right (end)
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
