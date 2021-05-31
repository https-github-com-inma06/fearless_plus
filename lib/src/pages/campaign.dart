import 'package:fearlessassemble/src/components/campaign_widget.dart';
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
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed("asdfasdf"); 클릭시 영상으로 이동
                      print("광고 클릭되었습니다"); // TODO : 영상 링크 이동 작업
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
}
