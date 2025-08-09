import 'package:components/data/models/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:components/view/screens.dart';
class AppRoutes {

  static const String initialRoute = homeScreen;

  // static constants to define or named routes
  static const String homeScreen = 'homescreen';
  static const String listScreen = 'listbuilderscreen';
  static const String alertScreen = 'alertscreen';
  static const String cardScreen = 'cardscreen';
  static const String formScreen = 'formscreen';

  static final MenuOptions = <MenuOption> [
    MenuOption(icon: Icons.home_max_outlined, name: 'Home Screen', route: homeScreen, screen: const HomeScreen()),
    MenuOption(icon: Icons.list_outlined, name: 'List View', route: listScreen, screen: const ListViewBuilderScreen()),
    MenuOption(icon: Icons.perm_identity_outlined, name: 'Card', route: cardScreen, screen: const CardScreen()),
    MenuOption(icon: Icons.warning_outlined, name: 'Alert', route: alertScreen, screen: const AlertScreen()),
    MenuOption(icon: Icons.note_outlined, name: 'Form', route: formScreen, screen: const FormScreen()),
    ];

    static Map<String,Widget Function(BuildContext)> getRoutes() {
      Map<String,Widget Function(BuildContext)> routes = {};
      for(MenuOption menuOption in MenuOptions){
        routes.addAll({menuOption.route : (context) => menuOption.screen});
      }
      return routes;
    }

  //static Map<String,Widget Function(BuildContext)> routes = {
   //     homeScreen: (context) => HomeScreen(),
    //    listScreen: (context) => ListViewBuilderScreen(),
     //   alertScreen: (context) => AlertScreen(),
      //  cardScreen: (context) => CardScreen(),
       // formScreen: (context) => FormScreen(),
      //};

    static Route<dynamic>? onGenerateRoute(RouteSettings routeSetting ){
      return MaterialPageRoute(builder: (context)=> const AlertScreen());
    }
}