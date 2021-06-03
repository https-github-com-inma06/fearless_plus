import 'dart:convert';
import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/src/models/video/video_model.dart';
import 'package:fearlessassemble/src/pages/video.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/campaign/campaign_model.dart';
import '../../models/event/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoWidget extends StatefulWidget {
  final VideoModel video;
  // pages - video_model.dart 에서  넘겨 받음
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        child: CachedNetworkImage(
          imageUrl: widget.video.code == null
              ? ""
              : "https://img.youtube.com/vi/${widget.video.code}/hqdefault.jpg",
          placeholder: (context, url) => Container(
            width: 400,
            height: 225,
            child: Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => Image.asset(
            "assets/images/null-img.png",
            width: Get.width,
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
            widget.video.title,
            maxLines: 2,
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
