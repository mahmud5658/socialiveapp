import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialive/utils/assets_paths.dart';

import '../controllers/theme_controller.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

final ThemeController _themeController = Get.find();

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    _themeController.updateTheme(context);
    return Obx(() {
      return SvgPicture.asset(
        AssetsIcon.appLogo,
        colorFilter: ColorFilter.mode(
          _themeController.logoColor,
          BlendMode.srcIn,
        ),
      );
    });
  }
}