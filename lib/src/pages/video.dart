import 'dart:convert';

import 'package:fearlessassemble/src/components/appbar/campaign_appbar.dart';
import 'package:fearlessassemble/src/components/appbar/video_appbar.dart';
import 'package:fearlessassemble/src/components/video_widget.dart';
import 'package:fearlessassemble/src/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Video extends StatelessWidget {
  Video({Key key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: VideoAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () {
                        // Get.toNamed("asdfasdf"); 클릭시 영상으로 이동
                        print(
                            "이벤트 클릭되었습니다 ${utf8.decode(videoController.videoResponseResult.value.lists[index].title.codeUnits)}"); // TODO : 영상 링크 이동 작업
                      },
                      child: VideoWidget(
                        video: videoController.videoResponseResult.value
                            .lists[index], // VideoWidget 으로 값 넘겨줌
                      ),
                    ),
                  );
                },
                childCount: videoController.videoResponseResult.value.lists ==
                        null
                    ? 0
                    : videoController.videoResponseResult.value.lists.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
