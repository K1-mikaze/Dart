import 'package:flutter/material.dart';
import './view/screens.dart';

void main() {
  runApp(const To_do());
}

class To_do extends StatelessWidget {
  const To_do({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ListViewBuilderScreen(),
    );
  }
}




