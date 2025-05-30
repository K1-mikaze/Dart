import 'package:flutter/material.dart';

class MenuOption {
  final IconData icon;
  final String name;
  final String route;
  final Widget screen;

  MenuOption({
    required this.route,
    required this.name,
    required this.screen,
    required this.icon,
  });
}
