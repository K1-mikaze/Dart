import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _CustomButton(icon: Icons.call, text: "CALL", color: Colors.indigo),
          _CustomButton(
            icon: Icons.near_me,
            text: "ROUTE",
            color: Colors.green,
          ),
          _CustomButton(icon: Icons.share, text: "SHARE", color: Colors.red),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const _CustomButton({
    required this.text,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, color: color),
        SizedBox(height: 5),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}
