import 'package:flutter/material.dart';

import '../../data/models/models.dart';
import '../../view/screens/screens.dart';

class AppRoute {
  // constantes estáticas para definir o nombrar las rutas
  static const String homeScreen = 'homescreen';
  static const String listScreen = 'listbuilderscreen';
  static const String alertScreen = 'alertscreen';
  static const String cardScreen = 'cardscreen';
  static const String formScreen = 'formscreen';

  // ruta inicial para llamar desde main
  static const String initialRoute = homeScreen;

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: homeScreen,
      name: 'Home screen',
      screen: const HomeScreen(),
      icon: Icons.home,
    ),
    MenuOption(
      route: listScreen,
      name: 'List view builder - Listados',
      screen: const ListViewBuilderScreen(),
      icon: Icons.list,
    ),
    MenuOption(
      route: alertScreen,
      name: 'Alert - ShowDialog/AlerDialog',
      screen: const AlertScreen(),
      icon: Icons.warning_amber_rounded,
    ),
    MenuOption(
      route: cardScreen,
      name: 'Card - panel de esquina redondeada',
      screen: const CardScreen(),
      icon: Icons.credit_card,
    ),
    MenuOption(
      route: formScreen,
      name: 'Form - formularios, varios controles',
      screen: const FormScreen(),
      icon: Icons.format_align_justify_rounded,
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
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
