import 'package:design/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Design());

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Design',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
