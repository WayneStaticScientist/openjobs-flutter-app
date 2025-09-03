import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class OpxSearchFilter extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffix;
  const OpxSearchFilter({
    super.key,
    required this.hintText,
    this.suffix,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey.withAlpha(26),
          filled: true,
          hint: Text(hintText),
          border: InputBorder.none,
          suffixIcon: suffix,
          prefixIcon: Icon(LineAwesomeIcons.search_solid),
        ),
      ),
    );
  }
}
