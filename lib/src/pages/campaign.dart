import 'package:fearlessassemble/src/components/campaign_widget.dart';
import 'package:fearlessassemble/src/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class Campaign extends StatelessWidget {
  const Campaign({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
                    // 클릭시 영상으로 이동
                    print("광고 클릭되었습니다"); // TODO : 영상 링크 이동 작업
                  },
                  child: CampaignWidget(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
