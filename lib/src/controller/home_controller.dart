/* init -> Youtube Video Load */

import 'package:fearlessassemble/src/models/youtube/youtube_video_result.dart';
import 'package:fearlessassemble/src/repository/youtube_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _event() {
    /* infinity scroll
    * 스크롤이 바닥에 닿았을 때 다음 페이지 호출
    *  */
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPageToken != "") {
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult = await YoutubeRepository.to
        .loadVideos(youtubeResult.value.nextPageToken ?? "");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items.length > 0) {
      youtubeResult.update((youtube) {
        youtube.nextPageToken = youtubeVideoResult.nextPageToken;
        youtube.items.addAll(youtubeVideoResult.items);
      });
    }
  }
}
