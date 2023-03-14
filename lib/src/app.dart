import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/controller/bottom_nav_controller.dart';
import 'package:flutter_instagram_clone/src/pages/active_history.dart';
import 'package:flutter_instagram_clone/src/pages/home.dart';
import 'package:flutter_instagram_clone/src/pages/my_page.dart';
import 'package:flutter_instagram_clone/src/pages/search.dart';
import 'package:get/get.dart';

import 'components/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              // 중첩 라우팅 관리를 위한 Navigator 설정
              Navigator(
                key: controller.searchPageNavigationKey,
                onGenerateRoute: (routeSetting) {
                  return MaterialPageRoute(
                    builder: (context) => const Search(),
                  );
                },
              ),
              Container(),
              const ActiveHistory(),
              const MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              onTap: controller.changeBottomNav,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(IconsPath.homeOff),
                  activeIcon: Image.asset(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(IconsPath.searchOff),
                  activeIcon: Image.asset(IconsPath.searchOn),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(IconsPath.uploadIcon),
                  label: 'upload',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(IconsPath.activeOff),
                  activeIcon: Image.asset(IconsPath.activeOn),
                  label: 'active',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  label: 'avarta',
                ),
              ]),
        ),
      ),
    );
  }
}
