import 'package:get/get.dart';
import 'package:socialive/views/auth/sign_in_screen.dart';
import 'package:socialive/views/auth/sign_up_screen.dart';
import 'package:socialive/views/auth/welcome_screen.dart';
import 'package:socialive/views/screens/splash_screen/splash_screen.dart';
import 'package:socialive/views/home/messenger/messenger_screen.dart';
import 'package:socialive/views/home/notification/notification_screen.dart';

import '../views/screens/bottom_navigation/bottom_navigation.dart';

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String welcome = '/welcome-screen';
  static const String bottomNavScreen = '/bottom-nav-screen';
  static const String logInScreen = '/log-in-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String messengerScreen = '/messenger-screen';
  static const String notificationScreen = '/notification-screen';

  // Routes list
  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: welcome,
      page: () => const WelcomeScreen(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: bottomNavScreen,
      page: () => const MainNavigationScreen(),
    ),
    GetPage(
      name: logInScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: messengerScreen,
      page: () => const MessengerScreen(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => const NotificationScreen(),
    ),
  ];
}
