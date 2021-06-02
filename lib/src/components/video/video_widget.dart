import 'dart:convert';
import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/src/models/video/video_model.dart';
import 'package:fearlessassemble/src/pages/video.dart';
import '../../models/campaign/campaign_model.dart';
import '../../models/event/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoWidget extends StatefulWidget {
  final VideoModel video;
  // pages - campaign_model.dart 에서  넘겨 받음
  const VideoWidget({Key key, this.video}) : super(key: key);

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
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
            imageUrl: "https://img.youtube.com/vi/${widget.video.code}/hqdefault.jpg" ==
                    null
                ? "https://pbs.twimg.com/media/EzLcSgSVgAE-r_Q.jpg" // TODO : 기본이미지 ( 이미지없을때 )
                : "https://img.youtube.com/vi/${widget.video.code}/hqdefault.jpg",
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(widget.video.title),
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
