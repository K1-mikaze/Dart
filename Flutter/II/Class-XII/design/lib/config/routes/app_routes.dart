import 'package:flutter/material.dart';

import '../../view/screens.dart';

class AppRoutes {
  // constantes estáticas para definir o nombrar las rutas
  static const String basicDesign = 'basicdesign';

  // ruta inicial para llamar desde main
  static const String initialRoute = basicDesign;

  // mapa estático de rutas para llamar desde main
  static Map<String, Widget Function(BuildContext)> routes = {
    basicDesign: (context) => const BasicDesign(),
  };
}
