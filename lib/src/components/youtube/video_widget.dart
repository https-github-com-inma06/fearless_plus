import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fearlessassemble/src/controller/youtube_controller.dart';
import 'package:fearlessassemble/src/models/youtube/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  const VideoWidget({Key key, this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController _videoController;

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
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
              // imageUrl: widget.video.snippet.thumbnails.high.url,
              imageUrl:
                  "https://img.youtube.com/vi/${widget.video.id.videoId}/hqdefault.jpg",
              placeholder: (context, url) => Container(
                height: Get.height - Get.height * 0.7,
                child: Center(child: CircularProgressIndicator()),
                // child: SvgPicture.asset("assets/svg/icons/null-img.svg"),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          /*
              * assets 이미지를 사용
              * child: Image.network(widget.video.snippet.thumbnails.medium.url,
              *    fit: BoxFit.fitWidth),
              * */
        ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 20),
      child: Row(
        children: [
          Obx(
            // 채널 썸네일
            () => CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(_videoController.youtuberThumbnailUrl).image,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.video.snippet.title,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      // 조회수
                      () => Text(
                        _videoController.viewCountString,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Text("   •   "),
                    Text(
                      // 영상등록일
                      DateFormat("yyyy-MM-dd")
                          .format(widget.video.snippet.publishTime),
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                )
              ],
            ),
          )
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
