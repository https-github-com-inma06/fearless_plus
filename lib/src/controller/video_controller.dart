import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/models/video/video_result.dart';
import 'package:fearlessassemble/src/repository/video_repository.dart';

import 'package:get/get.dart';

class VideoController extends GetxController {
  static VideoController get to => Get.find();

  Rx<VideoResult> videoResponseResult = VideoResult().obs;

  @override
  void onInit() {
    if (videoResponseResult.value == null) {
      Log().trace("video api Response : null");
    } else {
      Log().trace(videoResponseResult.toString());
    }
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    VideoResult videoResult = await VideoRepository.to.loadVideo();
    // print("event api response : ${videoResult.lists.length}");

    // if (videoResult != null &&
    // videoResult.lists != null &&
    // videoResult.lists.length > 0) {
    videoResponseResult(videoResult);
    // }
  }
}
