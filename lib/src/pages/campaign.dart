import 'package:fearlessassemble/src/components/campaign/campaign_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/campaign/campaign_widget.dart';
import '../components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/controller/campaign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Campaign extends StatelessWidget {
  Campaign({Key key}) : super(key: key);

  final CampaignController campaignController = Get.put(CampaignController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CampaignAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      campaignController.campaignResponseResult.value
                                  .lists[index].url ==
                              null
                          ? print("이벤트 클릭되었습니다 url == null")
                          : _launchInBrowser(campaignController
                              .campaignResponseResult.value.lists[index].url);
                      print(
                          "이벤트 클릭되었습니다 : ${campaignController.campaignResponseResult.value.lists[index].url}");
                    },
                    child: CampaignWidget(
                      campaign: campaignController.campaignResponseResult.value
                          .lists[index], // CampaignWidget 으로 값 넘겨줌
                    ),
                  );
                },
                childCount:
                    campaignController.campaignResponseResult.value.lists ==
                            null
                        ? 0
                        : campaignController
                            .campaignResponseResult.value.lists.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
