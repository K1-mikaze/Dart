import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inventario/config/routes/app_route.dart';
import 'package:inventario/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('es'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('es'),

      debugShowCheckedModeBanner: false,
      title: 'Inventario',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoute.intialRoute,
      routes: AppRoute.routes,
    );
  }
}
