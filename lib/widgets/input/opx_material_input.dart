import 'package:flutter/material.dart';

class OpenXInput extends StatelessWidget {
  final Icon leadingIcon;
  final String hint;
  const OpenXInput({super.key, required this.leadingIcon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: leadingIcon,
        hint: Text(hint),
        filled: true,
        fillColor: Colors.grey.withAlpha(26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 8),
        ),
      ),
    );
  }
}
