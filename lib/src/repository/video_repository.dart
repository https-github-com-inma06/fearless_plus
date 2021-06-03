import 'dart:convert';

import 'package:fearlessassemble/src/models/video/video_result.dart';
import 'package:get/get.dart';

class VideoRepository extends GetConnect {
  static VideoRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.fearless-plus.cf/api/v1";
    super.onInit();
  }

  Future<VideoResult> loadVideo() async {
    String url = "/hotVideos?tag_id=1&off_set=1&page_size=10";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {
        return VideoResult.fromJson(response.body);
      }
    }
  }
}
