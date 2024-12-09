import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialive/routes/app_routes.dart';
import 'package:socialive/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Get.offAllNamed(AppRoutes.bottomNavScreen);
    } else {
      Get.offAllNamed(AppRoutes.welcome);
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                "Version 1.0.0",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
