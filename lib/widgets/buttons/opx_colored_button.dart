import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpxColoredButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const OpxColoredButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        backgroundColor: Get.isDarkMode
            ? Colors.orange
            : Get.theme.colorScheme.primary,
      ),
      child: Text(
        text,
        style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }
}
