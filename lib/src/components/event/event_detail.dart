import 'package:fearlessassemble/src/controller/event_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetail extends GetView<EventDetailController> {
  const EventDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(controller.title), // 제목
          Text(controller.shortDesc), // 간략설명
          Text(controller.startTime), // 시작
          Text(controller.endTime), // 종료
          Text(controller.thumbnailImg), // 썸넬
          Text(controller.url), // 링크
          Text(controller.description), // 상세설명
        ],
      ),
    );
  }
}
