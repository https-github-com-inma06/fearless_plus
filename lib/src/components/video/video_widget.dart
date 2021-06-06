import 'dart:convert';
import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/src/models/video/video_model.dart';
import 'package:fearlessassemble/src/pages/video.dart';
import 'package:flutter/widgets.dart';
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
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: CachedNetworkImage(
          width: Get.context.width,
          fit: BoxFit.fitWidth,
          imageUrl: widget.video == null
              ? SvgPicture.asset(
                  "assets/svg/icons/null-img.svg",
                )
              : "https://img.youtube.com/vi/${widget.video.code}/hqdefault.jpg",
          errorWidget: (context, url, error) => SvgPicture.asset(
            "assets/svg/icons/null-img.svg",
          ),
          placeholder: (context, url) => ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 278.5,
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
      child: Text(
        widget.video == null ? "해당 태그에 영상이 없습니다" : widget.video.title,
        maxLines: 2,
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
