import 'package:socialive/widgets/app_logo.dart';

import '../../my_imports.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(height: 40),

            // Create Account Button
            CustomButtonAuth(
              text: "Create Account",
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              onTap: () {
                // Navigate to Sign Up Screen
                Get.to(() => const SignUpScreen());
              },
            ),
            const SizedBox(height: 10),

            // Log In Button
            CustomButtonAuth(
              text: "Log In",
              backgroundColor: Colors.transparent,
              textColor: Colors.blue,
              onTap: () {
                // Navigate to Login Screen
                Get.to(() => const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
