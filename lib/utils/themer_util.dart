import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemerUtil {
  static getPaint() {
    return Get.isDarkMode ? Colors.white : Colors.black;
  }
}
