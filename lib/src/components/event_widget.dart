import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import '../models/event/event_model.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 230,
          child: CachedNetworkImage(
            imageUrl: widget.event.image == null
                ? "https://pbs.twimg.com/media/EzLcSgSVgAE-r_Q.jpg"
                : widget.event.image, // TODO: 광고 썸네일 API 작업
            placeholder: (context, url) => Container(
              child: Center(child: CircularProgressIndicator()),
              height: 230,
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(utf8.decode(
              widget.event.title.codeUnits)), // TODO: 한글 표시안되는 문제 api받아올때 해결해야함
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
