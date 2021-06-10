import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ChartWidget extends StatefulWidget {
  // final ChartModel chart;
  // pages - video_model.dart 에서  넘겨 받음
  // const ChartWidget({Key key, this.chart}) : super(key: key);
  const ChartWidget({Key key}) : super(key: key);

  @override
  ChartWidgetState createState() => ChartWidgetState();
}

class ChartWidgetState extends State<ChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget _cardView() {
    return Container(
      width: Get.width - (Get.width * 0.7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
          color: Colors.amberAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sunday, Jun 12, 2021'),
                  Text(
                    'Daily Chart',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 60,
                height: 25,
                child: ElevatedButton(
                  onPressed: () {
                    _launchInBrowser('http://naver.com');
                    print('clicked button');
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Color(0xFFFF8B50);
                        } else {
                          return Color(0xFFFF8B50);
                        }
                      },
                    ),
                  ),
                  child: Text('GO'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _cardView(),
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
    throw 'Could not launch $url'; // if(scheme != http || https) TODO: 스킴에 따른 설정
  }
}
