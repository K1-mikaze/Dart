import 'package:flutter/material.dart';

import '../../view/screens/screens.dart';

class AppRoute {
  static const intialRoute = productoFormScreen;

  // constantes estáticas para definir o nombrar las rutas
  static const String productoFormScreen = 'productoformscreen';  

  static Map<String, Widget Function(BuildContext)> routes = {
    productoFormScreen: (context) => const ProductoFormScreen()
  };

}