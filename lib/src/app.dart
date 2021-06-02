import 'package:fearlessassemble/src/development/dev_page.dart';
import 'package:fearlessassemble/src/pages/about.dart';
import 'package:fearlessassemble/src/pages/chart.dart';
import 'package:fearlessassemble/src/pages/campaign.dart';
import 'package:fearlessassemble/src/pages/event.dart';
import 'package:fearlessassemble/src/pages/setting.dart';
import 'package:fearlessassemble/src/pages/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'controller/app_controller.dart';
import 'pages/calendar.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Calendar:
            return Calendar();
            break;
          case RouteName.Chart:
            return Chart();
            break;
          case RouteName.Video:
            return Video();
            break;
          case RouteName.Event:
            return Event();
            break;
          case RouteName.About:
            return About();
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: controller.changePageIndex,
          items: [
            /* 캘린더 */
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black87,
              ),
              label: "CALENDAR",
            ),

            /* 차트 */
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.bar_chart,
                color: Colors.black87,
              ),
              label: "CHART",
            ),

            /* 영상 */
            BottomNavigationBarItem(
              icon: Icon(
                Icons.ondemand_video,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.ondemand_video,
                color: Colors.black87,
              ),
              label: "VIDEO",
            ),
            /* 광고 / 캠페인 */
            BottomNavigationBarItem(
              icon: Icon(
                Icons.campaign,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.campaign,
                color: Colors.black87,
              ),
              label: "CAMPAIGN",
            ),

            /* About */
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black45,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              label: "ABOUT",
            ),
          ],
        ),
      ),
    );
  }
}
