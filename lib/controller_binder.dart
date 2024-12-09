import 'package:get/get.dart';
import 'package:socialive/controllers/picture_controller.dart';
import 'package:socialive/controllers/theme_controller.dart';
import '../controllers/bottom_navbar_controller.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavbarController>(BottomNavbarController(), permanent: true);
    Get.put(ThemeController());
    Get.lazyPut(()=> PictureController());
  }
}
