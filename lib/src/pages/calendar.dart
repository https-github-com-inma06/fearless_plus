import 'package:fearlessassemble/src/components/bottom_sheet/noti_bottom_sheet.dart';
import 'package:fearlessassemble/src/components/calendar/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Calendar extends StatelessWidget {
  Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Calendar'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 4.3),
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
        child: CalendarWidget(),
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
