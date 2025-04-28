import 'package:flutter/material.dart';
import './view/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev Notes',
      theme: ThemeData(colorScheme: ColorScheme.highContrastDark()
			),
      home: NotePadViewBuilder(),
    );
  }
}
