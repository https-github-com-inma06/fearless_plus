import 'package:fearlessassemble/src/pages/about.dart';
import 'package:fearlessassemble/src/pages/app_info.dart';
import 'package:fearlessassemble/src/pages/chart.dart';
import 'package:fearlessassemble/src/pages/home.dart';
import 'package:fearlessassemble/src/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (RouteName.values[controller.currentIndex.value]) {
            // case RouteName.Calendar:
            //   return Calendar();
            //   break;
            // case RouteName.Chart:
            //   return Menu();
            //   break;
            // case RouteName.Video:
            //   return Video();
            //   break;
            case RouteName.Youtube:
              return Home();
              break;
            // case RouteName.Event:
            //   return Event();
            //   break;
            case RouteName.About:
              return About();
              break;
            case RouteName.AppInfo:
              return AppInfo();
              break;
          }
          return Container();
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: controller.changePageIndex,
          items: [
            // // /* 차트 */
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset('assets/svg/icons/ico_chart.svg'),
            //   activeIcon: SvgPicture.asset('assets/svg/icons/ico_chart_on.svg'),
            //   label: "CHART",
            // ),

            /* 영상 */
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/ico_bgtube.svg'),
              activeIcon:
                  SvgPicture.asset('assets/svg/icons/ico_bgtube_on.svg'),
              label: "YOUTUBE",
            ),

            /* About */
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/ico_aboutbg.svg'),
              activeIcon:
                  SvgPicture.asset('assets/svg/icons/ico_aboutbg_on.svg'),
              label: "ABOUT BG",
            ),
            /* About */
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_sharp),
              activeIcon: Icon(Icons.more_horiz),
              label: "APP INFO",
            ),
          ],
        ),
      ),
    );
  }
}
