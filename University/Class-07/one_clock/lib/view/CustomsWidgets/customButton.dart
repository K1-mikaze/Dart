import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget{

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      shape: const StadiumBorder(),
      backgroundColor: Colors.indigoAccent,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child:Icon(icon),
    );
  }
}
