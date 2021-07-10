import 'package:fearlessassemble/src/models/youtube/statistics.dart';
import 'package:fearlessassemble/src/models/youtube/youtube_video_result.dart';
import 'package:fearlessassemble/src/models/youtube/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();
  // youtubeApiKey_1 = AIzaSyBMemiZMtzw3OAASdxSK6yoV-1UISvGncg
  // youtubeApiKey_2 = AIzaSyB66er1Lgh1GZM7ruWQ0_Tz8AzvL7ppfKI

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos(String nextPageToken) async {
    /* TODO : 채널 아이디 */
    // String channelId = "UCzMHloI_qrfCO0Wp4s7UC_Q";
    String channelId = "UCrhH1dPISpWYDA6h5XHE9sw";
    String url = "/youtube/v3/search?"
        "part=snippet&"
        "channelId=$channelId&"
        "maxResults=10&"
        "order=date&"
        "type=video&"
        "videoDefinition=high&"
        "key=AIzaSyB66er1Lgh1GZM7ruWQ0_Tz8AzvL7ppfKI&"
        "pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url = "/youtube/v3/videos?"
        "part=statistics&"
        "key=AIzaSyB66er1Lgh1GZM7ruWQ0_Tz8AzvL7ppfKI&"
        "id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url = "/youtube/v3/channels?"
        "part=statistics,snippet&"
        "key=AIzaSyB66er1Lgh1GZM7ruWQ0_Tz8AzvL7ppfKI&"
        "id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
