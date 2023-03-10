import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/controller/bottom_nav_controller.dart';
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
          appBar: AppBar(),
          body: IndexedStack(index: controller.pageIndex.value, children: [
            Container(
              child: Center(child: Text("HOME")),
            ),
            Container(
              child: Center(child: Text("SEARCH")),
            ),
            Container(
              child: Center(child: Text("UPLOAD")),
            ),
            Container(
              child: Center(child: Text("ACTIVITY")),
            ),
            Container(
              child: Center(child: Text("MYPAGE")),
            ),
          ]),
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
