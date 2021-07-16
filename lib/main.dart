import 'package:fearlessassemble/src/components/about/about_detail_widget.dart';
import 'package:fearlessassemble/src/components/youtube/youtube_detail.dart';
import 'package:fearlessassemble/src/controller/youtube_datail_controller.dart';
import 'package:fearlessassemble/src/pages/app_info.dart';
import 'package:fearlessassemble/src/pages/menu.dart';
import 'package:fearlessassemble/src/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/binding/init_binding.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return GetMaterialApp(
      title: "Fearless_App",
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/menuChart/",
          page: () => Menu(),
        ),
        GetPage(
          name: "/main/",
          page: () => App(),
        ),
        GetPage(
          name: "/aboutDetail/",
          page: () => AboutDetailWidget(),
          transitionDuration: Duration(milliseconds: 600),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: "/appInfo/",
          page: () => AppInfo(),
        ),
        GetPage(
            name: "/detail/:videoId",
            page: () => YoutubeDetail(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController()))),
      ],
    );
  }
}
