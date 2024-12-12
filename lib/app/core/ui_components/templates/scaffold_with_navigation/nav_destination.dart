import 'package:flutter/material.dart';

class NavDestination {
  const NavDestination({
    required this.title,
    required this.icon,
    this.activeIcon,
  });
  final String title;
  final IconData icon;
  final IconData? activeIcon;
}
