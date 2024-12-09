import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkTheme = true.obs;

  void updateTheme(BuildContext context) {
    isDarkTheme.value = Theme.of(context).brightness == Brightness.dark;
  }
  Color get logoColor => isDarkTheme.value ? Colors.white : Colors.black;
}