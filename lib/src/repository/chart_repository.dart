import 'package:fearlessassemble/src/models/chart/chart_result.dart';

import 'package:get/get.dart';

class ChartRepository extends GetConnect {
  static ChartRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.fearlessplus.net/api/v1";
    super.onInit();
  }

  Future<ChartResult> loadChart() async {
    String url = "/charts";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {
        return ChartResult.fromJson(response.body);
      }
    }
  }
}
