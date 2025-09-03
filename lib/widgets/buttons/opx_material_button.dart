import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpxMaterialButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const OpxMaterialButton({
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
            ? Colors.white
            : Get.theme.colorScheme.primary,
      ),
      child: Text(
        text,
        style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }
}
