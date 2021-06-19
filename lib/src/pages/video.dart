import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/app.dart';
import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/video/video_widget.dart';
import 'package:fearlessassemble/src/controller/video_controller.dart';
import 'package:fearlessassemble/src/models/video/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Video extends StatelessWidget {
  Video({Key key}) : super(key: key);
  final VideoController videoController = Get.put(VideoController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  // @override
  // void initState() {
  //   super.initState();
  //   random = Random();
  //   refreshList();
  // }
  //
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<VideoModel> videoModel =
        videoController.videoResponseResult.value.lists;
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refreshList,
        key: refreshKey,
        child: Obx(
          () => CustomScrollView(
            controller: videoController.scrollController,
            slivers: [
              SliverAppBar(
                // toolbarHeight: 100,
                title: Container(
                  child: CustomAppBar(
                    title: 'Video',
                    hasNewNotify: false, // TODO : obx 처리
                  ),
                ),
                floating: true,
                snap: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      color: Color(0xfff2f2f2),
                      child: GestureDetector(
                        onTap: () {
                          LaunchInBrowser().launchInBrowser(
                              "https://www.youtube.com/watch?v=${videoModel[index].code}");
                          print("쁘튜브 클릭되었습니다");
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: VideoWidget(
                            video: videoController.videoResponseResult.value
                                .lists[index], // VideoWidget 으로 값 넘겨줌
                          ),
                        ),
                      ),
                    );
                  },
                  childCount:
                      videoController.videoResponseResult.value.lists.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // }
  }
}
