import 'package:flutter/material.dart';

class OpxChip extends StatelessWidget {
  final String title;
  final IconData icon;
  const OpxChip({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(title), avatar: Icon(icon));
  }
}
