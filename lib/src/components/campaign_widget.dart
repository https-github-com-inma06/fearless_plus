import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import '../models/campaign/campaign_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampaignWidget extends StatefulWidget {
  final CampaignModel campaign;
  // pages - campaign_model.dart 에서  넘겨 받음
  const CampaignWidget({Key key, this.campaign}) : super(key: key);

  @override
  CampaignWidgetState createState() => CampaignWidgetState();
}

class CampaignWidgetState extends State<CampaignWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            // imageUrl: widget.video.snippet.thumbnails.high.url,
            imageUrl: widget.campaign.image == null
                ? "https://i.pinimg.com/originals/6e/2b/37/6e2b3766b78038cc505596134a5d1cda.jpg"
                : widget.campaign.image, // TODO: 광고 썸네일 API 작업
            height: 230,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
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
          Text(utf8.decode(widget.campaign.title.codeUnits)), // 한글 인코딩
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
