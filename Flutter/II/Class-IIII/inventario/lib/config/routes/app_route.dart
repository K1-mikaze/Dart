import 'package:flutter/material.dart';

import '../../view/screens/screens.dart';

class AppRoute {
  static const intialRoute = productoListScreen;

  // constantes estáticas para definir o nombrar las rutas
  static const String productoFormScreen = 'productoformscreen';  
  static const String productoListScreen = 'productolistscreen';  

  static Map<String, Widget Function(BuildContext)> routes = {
    productoFormScreen: (context) => const ProductoFormScreen(),
    productoListScreen: (context) => const ProductoListScreen(),

  };

}