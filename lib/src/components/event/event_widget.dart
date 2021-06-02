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
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: Get.width,
        child: CachedNetworkImage(
          imageUrl: widget.event.thumbnailImg == null
              ? ""
              : widget.event.thumbnailImg,
          placeholder: (context, url) => Container(
            width: 400,
            height: 225,
            child: Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => Image.asset(
            "assets/images/null-img.png",
            width: 400,
            height: 225,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
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
