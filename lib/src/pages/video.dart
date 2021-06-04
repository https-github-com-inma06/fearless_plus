import 'dart:convert';
import 'dart:developer';

import 'package:fearlessassemble/src/components/video/video_appbar.dart';
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
  bool isApiResponse = true;

  @override
  Widget build(BuildContext context) {
    List<VideoModel> videoModel =
        videoController.videoResponseResult.value.lists;
    if (videoModel == null) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: VideoAppBar(),
        ),
        body: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: SvgPicture.asset('assets/svg/icons/null-img.svg')),
      );
    }

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
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        videoModel == null
                            ? _launchInBrowser(
                                "https://www.youtube.com") // url 없을 때
                            : _launchInBrowser(
                                "https://www.youtube.com/watch?v=${videoModel[index].code}");
                        print("이벤트 영상 클릭되었습니다");
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: isApiResponse == false
                            ? SvgPicture.asset('assets/svg/icons/null-img.svg')
                            : VideoWidget(
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
