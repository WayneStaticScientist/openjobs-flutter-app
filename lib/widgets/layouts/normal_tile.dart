import 'package:flutter/material.dart';
import 'package:openjobs/utils/themer_util.dart';

class NormalTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  const NormalTile({super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: ThemerUtil.getPaint())),
      leading: Icon(iconData, color: ThemerUtil.getPaint()),
    );
  }
}
