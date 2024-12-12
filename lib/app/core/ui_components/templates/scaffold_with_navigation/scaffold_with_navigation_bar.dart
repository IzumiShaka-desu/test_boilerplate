import 'package:flutter/material.dart';

import 'nav_destination.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.isNavbarVisible,
    required this.destinations,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool isNavbarVisible;
  final List<NavDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Material(
        elevation: 8,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isNavbarVisible ? null : 0,
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 16,
              top: 8,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              items: destinations
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Icon(e.icon),
                      label: e.title,
                      activeIcon: e.activeIcon != null ? Icon(e.activeIcon) : Icon(e.icon),
                    ),
                  )
                  .toList(),
              elevation: 0,
              onTap: onDestinationSelected,
            ),
          ),
        ),
      ),
    );
  }
}
