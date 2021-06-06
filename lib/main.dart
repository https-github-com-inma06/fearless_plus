import 'package:fearlessassemble/src/chart_controller/noti_history_controller.dart';
import 'package:flutter/services.dart';

import 'src/pages/noti_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/binding/init_binding.dart';

/*
WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
      Locale('ja', 'JP')
    ],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
 */

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
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
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
