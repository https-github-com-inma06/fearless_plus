import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/youtube/video_widget.dart';
import 'package:fearlessassemble/src/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              title: CustomAppBar(
                title: 'Video',
                hasNewNotify: false,
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
                        //page route
                        Get.toNamed(
                            "/detail/${controller.youtubeResult.value.items[index].id.videoId}"); // 영상클릭시 디테일 라우터로 이동
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: VideoWidget(  // Stateful 위젯
                            video: controller.youtubeResult.value.items[index]),
                      ),
                    ),
                  );
                },
                childCount: controller.youtubeResult.value.items == null
                    ? 0
                    : controller.youtubeResult.value.items.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
