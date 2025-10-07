import 'package:flutter/material.dart';

// import '../../view/screens/screens.dart';

class Routes {
  static const intialRoute = productoListScreen;

  // constantes estáticas para definir o nombrar las rutas
  static const String HomePage = 'HomePage';
  static const String productoListScreen = 'productolistscreen';
  static const String productoViewScreen = 'productoviewscreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    // productoFormScreen: (context) => const ProductoFormScreen(),
    // productoListScreen: (context) => const ProductoListScreen(),
    // productoViewScreen: (context) => const ProductoViewScreen(),
  };
}
