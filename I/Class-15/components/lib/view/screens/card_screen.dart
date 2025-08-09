import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Título de CardScreen'),
      ),
      body: const Center(child: Text('Contenido de CardScreen')),
    );
  }
}
