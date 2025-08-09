import 'package:components/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Componentes());
}

class Componentes extends StatelessWidget {
  const Componentes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
    );
  }
}
