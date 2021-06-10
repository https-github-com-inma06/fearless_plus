import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/models/video/video_data_model.dart';
import 'package:fearlessassemble/src/models/video/video_result.dart';
import 'package:fearlessassemble/src/repository/video_repository.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class VideoController extends GetxController {
  static VideoController get to => Get.find();

  Rx<VideoResult> videoResponseResult = VideoResult(lists: []).obs;
  Rx<VideoDataModel> videoResponseDataResult = VideoDataModel().obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    if (videoResponseResult.value == null) {
      Log().trace("video api Response : null");
    } else {
      Log().trace(videoResponseResult.toString());
    }
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Log().trace('list end');
      }
    });
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
