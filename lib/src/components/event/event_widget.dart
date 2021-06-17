import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/src/models/event/event_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EventWidget extends StatefulWidget {
  final EventModel event;
  // pages - campaign_model.dart 에서  넘겨 받음
  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  EventWidgetState createState() => EventWidgetState();
}

class EventWidgetState extends State<EventWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: CachedNetworkImage(
              height: Get.height - Get.height * 0.7,
              imageUrl: widget.event.thumbnailImg,
              errorWidget: (context, url, error) => SvgPicture.asset(
                "assets/svg/icons/null-img.svg",
              ),
              placeholder: (context, url) => Container(
                height: Get.height - Get.height * 0.7,
                child: SvgPicture.asset("assets/svg/icons/null-img.svg"),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.event.title == null ? "이벤트 제목이 없습니다" : widget.event.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
          ),
          Text(
            widget.event.description == null ? "" : widget.event.description,
            maxLines: 2,
          ),
          Text(
            widget.event.startTime == null
                ? ""
                : "${widget.event.startTime} ~ ${widget.event.endTime}",
            style: TextStyle(color: Colors.black26),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
