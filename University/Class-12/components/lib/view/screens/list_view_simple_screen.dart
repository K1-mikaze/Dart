import 'package:flutter/material.dart';

class ListViewSimpleScreen extends StatelessWidget {
  const ListViewSimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int cont = 0;
    return Scaffold(
      appBar: AppBar(title: Text('Listado con ListView')),
      body: Center(
        child: ListView(
          children: [
            Text('Texto No. ${++cont}'),
            Text('Texto No. ${++cont}'),
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.favorite, color: Colors.red),
            ),
            Text('Texto No. ${++cont}'),
          ],
        ),
      ),
    );
  }
}