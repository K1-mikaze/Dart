import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  final String? labelText;
  final Color? activeColor;
  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;
  const CustomSwitchButton({
    required this.labelText,
    this.activeColor,
    required this.value,
    required this.title,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: labelText,
      ),
      child: SwitchListTile(
        activeColor: activeColor,
        value: value,
        title: Text(title),
        onChanged: onChanged,
      ),
    );
  }
}
