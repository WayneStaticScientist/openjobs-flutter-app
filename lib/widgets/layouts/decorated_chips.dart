import 'package:flutter/material.dart';
import 'package:openjobs/utils/color_util.dart';

class OpxChip extends StatelessWidget {
  final String title;
  final IconData icon;
  const OpxChip({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      color: WidgetStateProperty.all<Color?>(ColorUtil.getMedianColor(title)),
      label: Text(title, style: TextStyle(color: Colors.white)),
      avatar: Icon(icon, color: Colors.white),
    );
  }
}
