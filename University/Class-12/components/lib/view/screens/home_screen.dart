import 'package:components/view/screens/list_view_builder_screen.dart';
import 'package:flutter/material.dart';

// List vistas = [
//   {'titulo': 'Home screen'},
//   {'titulo': 'List view builder - Listados'},
//   {'titulo': 'Alert - ShowDialog/AlerDialog'},
//   {'titulo': 'Card - panel de esquina redondeada '},
//   {'titulo': 'Form - formularios, varios controles'},
// ];

List vistas = [
  {'titulo': 'Home screen', 'ruta': 'homescreen'},
  {'titulo': 'List view builder - Listados', 'ruta': 'listbuilderscreen'},
  {'titulo': 'Alert - ShowDialog/AlerDialog', 'ruta': 'alertscreen'},
  {'titulo': 'Card - panel de esquina redondeada ', 'ruta': 'cardscreen'},
  {'titulo': 'Form - formularios, varios controles', 'ruta': 'formscreen'},
];

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
        itemBuilder: (context, idx) {
          return ListTile(
            leading: const Icon(Icons.rectangle_outlined),
            title: Text(vistas[idx]['titulo']),
            trailing: const Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(
            //   //     builder: (context) => ListViewBuilderScreen(),
            //   //   ),
            //   // );
            // },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: vistas.length,
      ),
    );
  }
}
