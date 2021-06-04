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
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: CachedNetworkImage(
          width: Get.context.width,
          fit: BoxFit.fitWidth,
          imageUrl: widget.event.thumbnailImg == null
              ? ""
              : widget.event.thumbnailImg,
          errorWidget: (context, url, error) => SvgPicture.asset(
            "assets/svg/icons/null-img.svg",
          ),
          placeholder: (context, url) => ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 150,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.event.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
          ),
          Text(
            widget.event.description,
            maxLines: 1,
          ),
          Text(
            "${widget.event.startTime} ~ ${widget.event.endTime}",
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
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
