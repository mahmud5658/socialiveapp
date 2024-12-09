import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:socialive/utils/theme/dark_theme.dart';
import 'package:socialive/utils/theme/light_theme.dart';
import 'package:socialive/views/profile/follower.dart';
import 'routes/app_routes.dart';
import 'controller_binder.dart';

class Socialive extends StatelessWidget {
  const Socialive({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinders(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
