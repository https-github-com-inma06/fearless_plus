import 'dart:convert';

import 'package:fearlessassemble/src/models/campaign/campaign_result.dart';
import 'package:get/get.dart';

class CampaignRepository extends GetConnect {
  static CampaignRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.fearless-plus.cf/api/v1";
    super.onInit();
  }

  Future<CampaignResult> loadCampaign() async {
    String url = "/events";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {
        return CampaignResult.fromJson(response.body);
      }
    }
  }
}
