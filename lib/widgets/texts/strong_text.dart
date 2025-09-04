import 'package:flutter/material.dart';
import 'package:openjobs/utils/themer_util.dart';

class StrongText extends StatelessWidget {
  final String text;
  const StrongText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ThemerUtil.getPaint(),
      ),
    );
  }
}
