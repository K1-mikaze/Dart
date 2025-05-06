import 'package:flutter/material.dart';
import 'package:components/view/screens.dart';
class AppRoutes {

  static const String initialRoute = 'listbuilderscreen';

  static Map<String,Widget Function(BuildContext)> routes = {
        'homescreen': (context) => HomeScreen(),
        'listbuilderscreen': (context) => ListViewBuilderScreen(),
        'alertscreen': (context) => AlertScreen(),
        'cardscreen': (context) => CardScreen(),
        'formscreen': (context) => FormScreen(),
      };
}