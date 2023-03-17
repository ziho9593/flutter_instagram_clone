import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/controller/auth_controller.dart';
import 'package:flutter_instagram_clone/src/models/instagram_user.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx<InstaUser> targetUser = InstaUser().obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  void setTargetUser() {
    var uid = Get.parameters['targetUid'];
    if (uid == null) {
      // 본인의 마이 페이지
      targetUser(AuthController.to.user.value);
    } else {
      // 상대 uid로 users collection을 조회
    }
  }

  void _loadData() {
    setTargetUser();
    // 포스트 리스트 로드

    // 사용자 정보 로드
  }
}
