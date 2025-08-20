import 'package:flutter/material.dart';

import 'view/screens/screens.dart';

void main() {
  runApp(Componentes());
}

class Componentes extends StatelessWidget {
  const Componentes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ListViewBuilderScreen(),
    );
  }
}
