import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/video/video_widget.dart';
import 'package:fearlessassemble/src/controller/video_controller.dart';
import 'package:fearlessassemble/src/models/video/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Video extends StatelessWidget {
  Video({Key key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    List<VideoModel> videoModel =
        videoController.videoResponseResult.value.lists;
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(
                title: 'Video',
                hasNewNotify: false, // TODO : obx 처리
                isSetting: false,
              ),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        LaunchInBrowser().launchInBrowser(
                            "https://www.youtube.com/watch?v=${videoModel[index].code}");
                        print("이벤트 영상 클릭되었습니다");
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: VideoWidget(
                          video: videoController.videoResponseResult.value
                              .lists[index], // VideoWidget 으로 값 넘겨줌
                        ),
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
    // }
  }
}
