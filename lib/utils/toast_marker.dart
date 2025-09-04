import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ToastMarker {
  static error(String message) {
    Get.snackbar(
      "Error",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      icon: Icon(
        LineAwesomeIcons.exclamation_triangle_solid,
        color: Colors.white,
      ),
    );
  }

  static success(String message) {
    Get.snackbar(
      "Success",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: Icon(LineAwesomeIcons.check_circle_solid, color: Colors.white),
    );
  }
}
