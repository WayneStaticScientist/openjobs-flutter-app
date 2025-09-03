import 'package:flutter/material.dart';

class ColorUtil {
  static Color getMedianColor(String input) {
    int code = input.toUpperCase().codeUnitAt(0);
    if (code < 65) code = 65;
    if (code > 90) code = 90;
    final double range = (code - 65) / 25;
    return HSLColor.fromAHSL(1, range * 360, 0.5, 0.5).toColor();
  }
}
