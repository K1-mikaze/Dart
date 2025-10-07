import 'package:flutter/material.dart';
import 'package:scholar_library/view/screens.dart';

class AppRoute {
  static const intialRoute = MenuScreen;

  static const String menuScreen = 'menuScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    menuScreen: (context) => const MenuScreen(),
  };
}
