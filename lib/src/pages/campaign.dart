import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/campaign/campaign_widget.dart';
import 'package:fearlessassemble/src/controller/campaign_controller.dart';
import 'package:fearlessassemble/src/models/campaign/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Campaign extends StatelessWidget {
  Campaign({Key key}) : super(key: key);
  final CampaignController campaignController = Get.put(CampaignController());
  @override
  Widget build(BuildContext context) {
    List<CampaignModel> campaignModel =
        campaignController.campaignResponseResult.value.lists;
    // 만약 api response 값이 null 이라면 예외처리
    if (campaignModel == null) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: CustomAppBar(
            title: 'Campaign',
            hasNewNotify: false, // TODO : obx 처리
            isSetting: false,
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: SvgPicture.asset('assets/svg/icons/null-img.svg')),
      );
    } else {
      return SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: CustomAppBar(
                  title: 'Video',
                  hasNewNotify: false, // TODO : obx 처리
                  isSetting: false,
                ),
                floating: true,
                snap: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          campaignModel == null
                              ? _launchInBrowser(
                                  "https://www.youtube.com") // url 없을 때
                              : _launchInBrowser(
                                  "https://www.youtube.com/watch?v=${campaignModel[index].url}");
                          print("이벤트 영상 클릭되었습니다");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CampaignWidget(
                            campaign: campaignController.campaignResponseResult
                                .value.lists[index], // VideoWidget 으로 값 넘겨줌
                          ),
                        ),
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
