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
    httpClient.baseUrl = "https://api.fearless-plus.cf/api/v1";
    super.onInit();
  }

  /*  off_set -> 현재페이지, page_size -> 한 페이지의 컨텐츠수 */
  Future<VideoResult> loadVideo() async {
    String url = "/hotVideos?tag_id=1&page=1&size=55";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {
        for (var i = 0; i < response.body["data"]["list"].length; i++) {
          print(
              "Video Response data->list : ${response.body["data"]["list"][i]}");
        }
        print("result size : ${response.body["data"]["list"].length} ");
        return VideoResult.fromJson(response.body);
      }
    }
  }
}
