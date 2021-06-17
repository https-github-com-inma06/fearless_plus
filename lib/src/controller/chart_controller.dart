import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/models/chart/chart_model.dart';
import 'package:fearlessassemble/src/models/chart/chart_result.dart';
import 'package:fearlessassemble/src/repository/chart_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartController extends GetxController {
  static ChartController get to => Get.find();

  Rx<ChartResult> chartResponseResult = ChartResult(lists: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    if (chartResponseResult.value == null) {
      Log().trace("chart api Response : null");
    } else {
      Log().trace("chart api Response : ${chartResponseResult.toString()}");
    }
    _chartLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Log().trace('list end');
      }
    });
  }

  void _chartLoad() async {
    ChartResult chartResult = await ChartRepository.to.loadChart();
    // print("chart api response : ${chartResult.lists.length}");
    chartResponseResult(chartResult);
  }
}
