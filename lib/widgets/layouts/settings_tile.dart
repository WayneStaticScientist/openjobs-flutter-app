import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final Widget child;
  const SettingsCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.withAlpha(26),
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
