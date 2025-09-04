import 'package:flutter/material.dart';
import 'package:openjobs/utils/themer_util.dart';

class BoldText extends StatelessWidget {
  final String text;
  const BoldText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ThemerUtil.getPaint(),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
