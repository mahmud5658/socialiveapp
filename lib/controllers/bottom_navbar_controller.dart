import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavbarController extends GetxController {
  int _selectedIndex = 0;
  final PageController pageController = PageController();

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  void selectCategory() {
    changeIndex(1); // Navigate to Search screen
  }

  void backToHome() {
    changeIndex(0); // Navigate to Home screen
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
