import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import '../../models/campaign/campaign_model.dart';
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            // color: Colors.grey.withOpacity(0.5),
            imageUrl: widget.campaign.thumbnailImg == null
                ? "https://i.pinimg.com/originals/6e/2b/37/6e2b3766b78038cc505596134a5d1cda.jpg"
                : widget.campaign.thumbnailImg,
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
            widget.campaign.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(widget.campaign.description),
          Text(
            "${widget.campaign.startTime} ~ ${widget.campaign.endTime}",
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
