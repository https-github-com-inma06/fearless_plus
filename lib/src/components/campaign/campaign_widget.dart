import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      margin: const EdgeInsets.only(top: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: CachedNetworkImage(
          imageUrl: widget.campaign.thumbnailImg == null
              ? "https://i.pinimg.com/originals/6e/2b/37/6e2b3766b78038cc505596134a5d1cda.jpg"
              : widget.campaign.thumbnailImg,
          errorWidget: (context, url, error) =>
              SvgPicture.asset('assets/svg/icons/null-img.svg'),
          placeholder: (context, url) => ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              height: 150,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.campaign.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
          ),
          Text(
            widget.campaign.description,
            maxLines: 1,
          ),
          Text(
            "${widget.campaign.startTime} ~ ${widget.campaign.endTime}",
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
