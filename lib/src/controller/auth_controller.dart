import 'package:flutter_instagram_clone/src/models/instagram_user.dart';
import 'package:flutter_instagram_clone/src/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<InstaUser> user = InstaUser().obs;

  Future<InstaUser?> loginUser(String uid) async {
    // DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signup(InstaUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    }
  }
}
