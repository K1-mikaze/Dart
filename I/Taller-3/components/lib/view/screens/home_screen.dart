import 'package:flutter/material.dart';
import '../../config/routes/app_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bienvenido a Mi Negocio'),
      ),
      body: ListView.separated(
        itemBuilder: (context, idx) {
          return ListTile(
            leading: Icon(AppRoute.menuOptions[idx].icon),
            title: Text(AppRoute.menuOptions[idx].name),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.menuOptions[idx].route);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: AppRoute.menuOptions.length,
      ),
    );
  }
}
