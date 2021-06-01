import 'dart:convert';

import 'package:fearlessassemble/src/components/appbar/campaign_appbar.dart';
import 'package:fearlessassemble/src/components/event_widget.dart';
import '../controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Event extends StatelessWidget {
  Event({Key key}) : super(key: key);

  final EventController eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CampaignAppBar(),
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
                            "이벤트 클릭되었습니다 ${utf8.decode(eventController.eventResponseResult.value.lists[index].title.codeUnits)}"); // TODO : 영상 링크 이동 작업
                      },
                      child: EventWidget(
                        event: eventController.eventResponseResult.value
                            .lists[index], // EventWidget 으로 값 넘겨줌
                      ),
                    ),
                  );
                },
                childCount: eventController.eventResponseResult.value.lists ==
                        null
                    ? 0
                    : eventController.eventResponseResult.value.lists.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
