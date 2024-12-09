import 'package:socialive/my_imports.dart';

ThemeData lightMode = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: AppColors.textColorLight,
            fontFamily: 'Satoshi-Medium',
            fontSize: 24),
        backgroundColor: AppColors.appBarBackgroundColorLight,
        elevation: 0.0,
        surfaceTintColor: Colors.white),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      surface: Color(0xffd2dcea),
      onSurface: Colors.black,
      surfaceTint: Colors.white12,
      primary: Colors.white,
      onPrimary: Colors.black,
      // secondary: Colors.grey.shade50,
      // inversePrimary: Colors.grey.shade900,
    ),
    textTheme: const TextTheme(
      titleLarge:
          TextStyle(fontFamily: 'Satoshi-Regular', fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Satoshi-Medium',
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'Satoshi-Medium',
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: 'Satoshi-Regular',
      ),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi-Medium' // Use a subdued dark mode text color
          ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color:
            AppColors.subtitleColorDark, // Use a subdued dark mode text color
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      labelStyle: const TextStyle(
        color: AppColors.subtitleColorLight,
      ),
      hintStyle: const TextStyle(
        color: AppColors.subtitleColorLight,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey, // Set the border color to blue
          width: 1.0, // Set the border width (optional)
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey, // Set the border color to blue
          width: 1.0, // Set the border width (optional)
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.borderColor, // Set the border color to blue
          width: 2.0, // Set the border width (optional)
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            foregroundColor: AppColors.secondaryColor,
            backgroundColor: AppColors.primaryColor,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColors.subtitleColor,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          )),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.black));
