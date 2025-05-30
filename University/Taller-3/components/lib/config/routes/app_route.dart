import 'package:flutter/material.dart';
import 'package:components/data/models/menu_options.dart';
import 'package:components/view/screenBundle.dart';

class AppRoute {
  static const String homeScreen = 'homescreen';
  static const String formScreen = 'formscreen';

  static const String initialRoute = homeScreen;

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: formScreen,
      name: 'Nuevo Producto',
      screen: const FormScreen2(),
      icon: Icons.add_box,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (MenuOption menuOption in menuOptions) {
      routes.addAll({menuOption.route: (context) => menuOption.screen});
    }
    return routes;
  }

  // mapa estático de rutas para llamar desde main
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   homeScreen: (context) => const HomeScreen(),
  //   listScreen: (context) => const ListViewBuilderScreen(),
  //   alertScreen: (context) => const AlertScreen(),
  //   cardScreen: (context) => const CardScreen(),
  //   formScreen: (context) => const FormScreen(),
  // };

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSetting) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
