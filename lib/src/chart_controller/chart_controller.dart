import 'package:fearlessassemble/src/models/chart/chart_result.dart';
import 'package:fearlessassemble/src/repository/chart_repository.dart';
import 'package:get/get.dart';

class ChartController extends GetxController {
  static ChartController get to => Get.find();

  Rx<ChartResult> chartResponseResult = ChartResult().obs;

  @override
  void onInit() {
    _eventLoad();
    super.onInit();
  }

  void _eventLoad() async {
    ChartResult chartResult = await ChartRepository.to.loadChart();
    print("chart api response : ${chartResult.lists.length}");

    if (chartResult != null &&
        chartResult.lists != null &&
        chartResult.lists.length > 0) {
      chartResponseResult(chartResult);
    }
  }
}
