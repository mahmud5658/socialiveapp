
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'my_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context)=> const Socialive())
  );
}