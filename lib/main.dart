import 'package:fearlessassemble/src/controller/noti_history_controller.dart';
import 'package:flutter/services.dart';

import 'src/pages/noti_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/binding/init_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

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
        GetPage(name: "/", page: () => App()),
        GetPage(
            name: "/noti_history/",
            page: () => NotiHistory(),
            binding: BindingsBuilder(() => Get.lazyPut<NotiHistoryController>(
                () => NotiHistoryController())))
      ],
    );
  }
}
