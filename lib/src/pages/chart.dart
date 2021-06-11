import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/chart/chart_widget.dart';
import 'package:fearlessassemble/src/controller/chart_controller.dart';
import 'package:fearlessassemble/src/models/chart/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Chart extends StatelessWidget {
  Chart({Key key}) : super(key: key);

  final chartController = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBar(
              title: 'Chart',
              hasNewNotify: false, // TODO : obx 처리
            ),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Color(0xfff2f2f2),
                  child: GestureDetector(
                    onTap: () {
                      // LaunchInBrowser()
                      //     .launchInBrowser(chartModel[index].dcUrl);
                      print("차트 클릭되었습니다");
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ChartWidget(
                        chart: chartController
                            .chartResponseResult.value.lists[index],
                      ),
                    ),
                  ),
                );
              },
              childCount:
                  chartController.chartResponseResult.value.lists == null
                      ? 0
                      : chartController.chartResponseResult.value.lists.length,
            ),
          ),
        ],
      ),
    );
  }
}
