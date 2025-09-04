import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openjobs/utils/themer_util.dart';

class OpxMaterialButton extends StatelessWidget {
  final String text;
  final bool? loading;
  final Function() onPressed;
  const OpxMaterialButton({
    super.key,
    this.loading,
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
        backgroundColor: ThemerUtil.getPaint(),
      ),
      child: !(loading == true)
          ? Text(
              text,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
