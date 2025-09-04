import 'package:flutter/material.dart';
import 'package:openjobs/utils/themer_util.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const ItemCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.withAlpha(26),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Icon(icon, size: 38, color: ThemerUtil.getPaint()),
              Text(
                title,
                style: TextStyle(fontSize: 18, color: ThemerUtil.getPaint()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
