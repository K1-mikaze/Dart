import 'package:components/config/routes/app_route.dart';
import 'package:components/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Componentes());
}

class Componentes extends StatelessWidget {
  const Componentes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('es'), Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // locale: WidgetsBinding.instance.platformDispatcher.locale,
      locale: const Locale('es'),

      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomeScreen(),
      initialRoute: AppRoute.homeScreen,
      routes: AppRoute.getRoutes(),
      onGenerateRoute: AppRoute.onGenerateRoute,
      theme: AppTheme.lighTheme,
    );
  }
}
