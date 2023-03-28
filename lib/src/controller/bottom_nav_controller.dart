import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/components/message_popup.dart';
import 'package:flutter_instagram_clone/src/controller/upload_controller.dart';
import 'package:flutter_instagram_clone/src/pages/upload.dart';
import 'package:get/get.dart';

// ignore: constant_identifier_names
enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();

  GlobalKey<NavigatorState> searchPageNavigationKey =
      GlobalKey<NavigatorState>(); // 중첩 라우팅 관리를 위한 글로벌 키 생성

  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload(), binding: BindingsBuilder(() {
          Get.put(UploadController());
        }));
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '시스템',
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: () {
            Get.back();
          },
        ),
      );
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];

      if (page == PageName.SEARCH) {
        // Search 페이지 안에서는 별도의 라우트 히스토리가 존재하기 때문에 따로 처리
        var value = await searchPageNavigationKey.currentState!
            .maybePop(); // Pop이 가능하면 true를 반환
        if (value) return false;
      }

      bottomHistory.removeLast();
      var idx = bottomHistory.last;
      changeBottomNav(idx, hasGesture: false);
      return false;
    }
  }
}
