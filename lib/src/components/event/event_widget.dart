import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/src/models/event/event_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            // color: Colors.grey.withOpacity(0.5),
            imageUrl: widget.event.thumbnailImg == null
                ? "https://i.pinimg.com/originals/6e/2b/37/6e2b3766b78038cc505596134a5d1cda.jpg"
                : widget.event.thumbnailImg,
            // TODO: 광고 썸네일 API 작업
            height: 230,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
          ),
          _simpleDetailInfo()
        ],
      ),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            utf8.decode(widget.event.title.codeUnits),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ), // TODO: 한글 표시안되는 문제 api받아올때 해결해야함
          Text(utf8.decode(widget.event.description.codeUnits)),
          Text(
            "${utf8.decode(widget.event.startTime.codeUnits)} ~ ${utf8.decode(widget.event.endTime.codeUnits)}",
            style: TextStyle(color: Colors.black26),
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
          // _simpleDetailInfo(),
        ],
      ),
    );
  }
}
