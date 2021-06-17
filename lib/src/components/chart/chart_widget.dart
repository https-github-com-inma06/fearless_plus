import 'package:cached_network_image/cached_network_image.dart';
import 'package:fearlessassemble/extension.dart';
import 'package:fearlessassemble/src/models/chart/chart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChartWidget extends StatefulWidget {
  final ChartModel chart;
  // pages - video.dart 에서  넘겨 받음
  const ChartWidget({Key key, this.chart}) : super(key: key);

  @override
  ChartWidgetState createState() => ChartWidgetState();
}

class ChartWidgetState extends State<ChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget _chart() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width / 1.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chart.writeDate,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.chart.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(65.0, 40.0),
                  primary: Color(0xFFFF8B50), // background
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  print("clicked chart url GO!");
                  LaunchInBrowser().launchInBrowser(widget.chart.dcUrl);
                },
                child: Text('GO'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _chart(),
    );
  }
}
