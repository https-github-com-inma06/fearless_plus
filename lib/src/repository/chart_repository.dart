import 'package:fearlessassemble/src/models/chart/chart_model.dart';
import 'package:fearlessassemble/src/models/chart/chart_result.dart';

import 'package:get/get.dart';

class ChartRepository extends GetConnect {
  static ChartRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.fearlessplus.net/app-api/v2";
    super.onInit();
  }

  Future<ChartResult> loadChart() async {
    String url = "/chart?size=10000&page=1"; // TODO : 하드코딩상태 페이징(x)
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {
        for (var i = 0; i < response.body["data"]["list"].length; i++) {
          print(
              "Chart Response data-> list : ${response.body["data"]["list"][i]}");
        }
        print("result size : ${response.body["data"]["list"].length} ");
        return ChartResult.fromJson(response.body);
      }
    }
  }
}
