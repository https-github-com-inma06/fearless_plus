import 'package:fearlessassemble/src/components/about/about_widget.dart';
import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/chart/menu_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomAppBar(
          title: 'Menu',
          hasNewNotify: false,
        ),
      ),
      body: Container(
        child:
        MenuChartWidget(),
      ),
    );
  }
}
