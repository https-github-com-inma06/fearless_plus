import 'dart:convert';

import 'package:fearlessassemble/src/components/video/video_appbar.dart';
import 'package:fearlessassemble/src/components/video/video_widget.dart';
import 'package:fearlessassemble/src/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        String url = "https://www.youtube.com/watch?"
                            "v=${videoController.videoResponseResult.value.lists[index].code}";
                        videoController.videoResponseResult.value.lists[index]
                                    .code ==
                                null
                            ? print("비디오 클릭되었습니다 url == null")
                            : _launchInBrowser(url);
                        print("이벤트 클릭되었습니다 : $url");
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

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
