import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/chart/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Chart extends StatelessWidget {
  Chart({Key key}) : super(key: key);

  // final ChartController chartController = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    // List<ChartModel> chartModel =
    //     chartController.chartResponseResult.value.lists;
    bool chartModel = false;
    // 만약 api response 값이 null 이라면 예외처리
    if (chartModel) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: CustomAppBar(
            title: 'Chart',
            hasNewNotify: false, // TODO : obx 처리
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(
                title: 'Chart',
                hasNewNotify: false, // TODO : obx 처리
              ),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      _launchInBrowser(
                          "https://xn--o39an51b2re.com/melon/dailychart/2021/06/05");
                      print("차트 클릭되었습니다");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 18),
                      child: ChartWidget(),
                    ),
                  ),
                );
              }, childCount: 20),
            ),
          ],
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
