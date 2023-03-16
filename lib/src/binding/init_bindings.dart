import 'package:flutter_instagram_clone/src/controller/auth_controller.dart';
import 'package:flutter_instagram_clone/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
