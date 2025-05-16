import 'package:components/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Título de HomeScreen'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: AppRoutes.MenuOptions.length,
        itemBuilder: (context, idx) {
          return ListTile(
            leading: Icon(AppRoutes.MenuOptions[idx].icon),
            title: Text(AppRoutes.MenuOptions[idx].name),
            trailing: const Icon(Icons.arrow_forward_ios),
             onTap: () {
              Navigator.pushNamed(context, AppRoutes.MenuOptions[idx].route);
             },
          );
        },
      ),
    );
  }
}
