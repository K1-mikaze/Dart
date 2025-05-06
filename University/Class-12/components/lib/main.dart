import 'package:components/config/routes/app_routes.dart';
import 'package:components/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'view/screens.dart';

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
      home: HomeScreen(),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
