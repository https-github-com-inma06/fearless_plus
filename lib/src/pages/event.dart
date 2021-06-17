import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:fearlessassemble/src/components/event/event_widget.dart';
import 'package:fearlessassemble/src/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

/*  캠페인 처음보이는 페이지 */

class Event extends StatelessWidget {
  Event({Key key}) : super(key: key);

  final EventController eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(
                title: 'Event',
                hasNewNotify: false,
              ),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 8,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        eventController.eventResponseResult.value.lists[index]
                                    .url ==
                                null
                            ? print("이벤트 클릭되었습니다 url == null")
                            : _launchInBrowser(eventController
                                .eventResponseResult.value.lists[index].url);
                        print(
                            "이벤트 클릭되었습니다 : ${eventController.eventResponseResult.value.lists[index].url}");
                      },
                      child: EventWidget(
                        event: eventController.eventResponseResult.value
                            .lists[index], // EventWidget 으로 값 넘겨줌
                      ),
                    ),
                  );
                },
                childCount: eventController.eventResponseResult.value.lists ==
                        null
                    ? 0
                    : eventController.eventResponseResult.value.lists.length,
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
