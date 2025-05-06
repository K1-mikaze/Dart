import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Título de FormScreen'),
      ),
      body: const Center(child: Text('Contenido de FormScreen')),
    );
  }
}
