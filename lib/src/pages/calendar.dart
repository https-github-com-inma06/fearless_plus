import 'package:fearlessassemble/src/components/about/about_widget.dart';
import 'package:fearlessassemble/src/components/calendar/calendar_widget.dart';
import 'package:fearlessassemble/src/components/campaign/campaign_appbar.dart';
import 'package:fearlessassemble/src/components/event/event_widget.dart';
import 'package:fearlessassemble/src/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Calendar extends StatelessWidget {
  Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CalendarWidget(),
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
