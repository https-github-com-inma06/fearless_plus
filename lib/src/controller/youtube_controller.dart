import 'package:fearlessassemble/src/models/youtube/statistics.dart';
import 'package:fearlessassemble/src/models/youtube/video.dart';
import 'package:fearlessassemble/src/models/youtube/youtuber.dart';
import 'package:fearlessassemble/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);

    Youtuber loadYoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";

  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FtYhPD%2Fbtq2CEI9fZo%2F2nBLbQk2MPCeZ4lgmr9OVk%2Fimg.png";
    return youtuber.value.snippet.thumbnails.medium.url;
  }
}
