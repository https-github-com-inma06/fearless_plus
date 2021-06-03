import 'package:fearlessassemble/src/components/about/about_widget.dart';
import 'package:fearlessassemble/src/components/bottom_sheet/noti_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  About({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('About BG'),
        leading: Container(
          margin: const EdgeInsets.only(left: 4.5),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/svg/icons/ico_setting.svg",
              width: 25,
              height: 25,
            ),
            onPressed: () {
              print('setting icon clicked');
            },
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 4.5),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/svg/icons/bell.svg",
                width: 25,
                height: 25,
              ),
              onPressed: () {
                print('bell icon clicked');
                Get.bottomSheet(NotiBottomSheet());
              },
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        child: AboutWidget(),
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
