import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/src/models/video/video_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: CachedNetworkImage(
              height: Get.height - Get.height * 0.7,
              imageUrl:
                  "https://img.youtube.com/vi/${widget.video.code}/hqdefault.jpg",
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
      padding: const EdgeInsets.only(top: 20, bottom: 40, left: 10, right: 10),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
