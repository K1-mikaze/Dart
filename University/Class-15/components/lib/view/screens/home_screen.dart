import 'package:flutter/material.dart';

import '../../config/routes/app_route.dart';

// List vistas = [
//   {'titulo': 'Home screen', 'ruta': AppRoute.homeScreen},
//   {'titulo': 'List view builder - Listados', 'ruta': AppRoute.listScreen},
//   {'titulo': 'Alert - ShowDialog/AlerDialog', 'ruta': AppRoute.alertScreen},
//   {'titulo': 'Card - panel de esquina redondeada', 'ruta': AppRoute.cardScreen},
//   {
//     'titulo': 'Form - formularios, varios controles',
//     'ruta': AppRoute.formScreen,
//   },
// ];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listado de componentes'),
      ),
      body: ListView.separated(
        itemBuilder: (context, idx) {
          return ListTile(
            leading: Icon(AppRoute.menuOptions[idx].icon),
            title: Text(AppRoute.menuOptions[idx].name),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewBuilderScreen(),),);
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
