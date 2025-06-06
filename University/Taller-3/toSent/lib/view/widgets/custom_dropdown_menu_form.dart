import 'package:flutter/material.dart';

class CustomDropdownButtonForm extends StatefulWidget {
  final List<String> options;
  final String labelName;

  const CustomDropdownButtonForm({
    super.key,
    required this.labelName,
    required this.options,
  });

  @override
  State<CustomDropdownButtonForm> createState() =>
      _CustomDropdownButtonFormState();
}

class _CustomDropdownButtonFormState extends State<CustomDropdownButtonForm> {
  @override
  Widget build(BuildContext context) {
    String option = widget.options.first;
    return DropdownButtonFormField(
      value: option,
      items:
          widget.options
              .map((op) => DropdownMenuItem(value: op, child: Text(op)))
              .toList(),
      onChanged: (value) {
        setState(() {
          option = value as String;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: widget.labelName,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
