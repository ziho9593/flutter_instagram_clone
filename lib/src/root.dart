import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/app.dart';
import 'package:flutter_instagram_clone/src/controller/auth_controller.dart';
import 'package:flutter_instagram_clone/src/models/instagram_user.dart';
import 'package:flutter_instagram_clone/src/pages/login.dart';
import 'package:flutter_instagram_clone/src/pages/sign_up_page.dart';
import 'package:get/get.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            // 내부 파이어베이스 유저 정보를 조회 with user.data.uid
            return FutureBuilder<InstaUser?>(
                future: controller.loginUser(user.data!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const App();
                  } else {
                    return Obx(
                      () => controller.user.value.uid != null
                          ? const App()
                          : SignUpPage(uid: user.data!.uid),
                    );
                  }
                });
          } else {
            return const Login();
          }
        });
  }
}
