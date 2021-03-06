import 'package:fearlessassemble/src/models/video/video_result.dart';
import 'package:get/get.dart';

enum TagName {
  MusicTvShow,
  Variety,
  Radio,
  FanCam,
}

class VideoRepository extends GetConnect {
  static VideoRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://api.fearlessplus.net/app-api/v2";
    super.onInit();
  }

  Future<VideoResult> loadVideo() async {
    String url = "/hotVideos?tag_id=1&page=1&size=1000";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {

        print(
          "Video Response data-> list : ${response.body["data"]["list"][0]}",
        );
        print("result size : ${response.body["data"]["list"].length} ");
        return VideoResult.fromJson(response.body);
      }
    }
  }
}
