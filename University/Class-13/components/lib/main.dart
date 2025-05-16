import 'package:components/config/routes/app_routes.dart';
import 'package:components/config/theme/app_theme.dart';
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
      theme: AppTheme.lightTheme,
      title: 'Material App',
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
    );
  }
}
