import 'package:flutter/material.dart';

class CustomRadioButtonForm extends StatefulWidget {
  final List<String> radioButtons;
  final String labelText;
  final String group;
  const CustomRadioButtonForm({
    super.key,
    required this.labelText,
    required this.radioButtons,
    required this.group,
  });

  @override
  State<CustomRadioButtonForm> createState() => _CustomRadioButtonForm();
}

class _CustomRadioButtonForm extends State<CustomRadioButtonForm> {
  late String _selectedValue;
  @override
  void initState() {
    super.initState();
    _selectedValue = widget.radioButtons.first;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Column(
        children: generateRadioButtons(widget.radioButtons, _selectedValue),
      ),
    );
  }

  List<RadioListTile> generateRadioButtons(List<String> buttons, String group) {
    return widget.radioButtons.map((button) {
      return RadioListTile(
        value: button,
        groupValue: _selectedValue,
        contentPadding: const EdgeInsets.all(0),
        title: Text(button),
        onChanged: (value) {
          setState(() {
            _selectedValue = value.toString();
          });
        },
      );
    }).toList();
  }
}
