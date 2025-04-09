import 'package:flutter/material.dart';
import 'View/Screens/screens.dart';

void main() {
  runApp(const Components());
}

class Components extends StatelessWidget {
  const Components({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'components basicos',
      home: ListViewBuilderScreen(),
    );
  }
}
