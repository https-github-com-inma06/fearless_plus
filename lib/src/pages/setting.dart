import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../extension.dart';

// TODO : GetX 미적용

// notification status
// 'insta'
// 'twitter'
// 'cafe-noti'
// 'cafe-event'
// 'gall-noti'
// 'gall-fund'
// 'gall-event'

class SettingContainer {
  static Map<String, bool> notificationStatus = Map<String, bool>();
}

Widget _divider(final thickness) {
  return SizedBox(height: thickness);
}

Icon _emptyIcon() {
  return Icon(Icons.no_cell, color: Colors.white);
}

void _emptyEvent() {}

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 노티 히스토리 테스트
    // Get.find()

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/svg/icons/bell.svg",
              color: Colors.black,
              height: 23,
              width: 23,
            ),
            onPressed: () {
              print("noti btn clicked");
            },
          ),
        ],
      ),
      body: Center(
        child: StateSetting(),
      ),
    );
  }
}

/*  */
class StateSetting extends StatefulWidget {
  @override
  _StateSettingState createState() => _StateSettingState();
}

class _StateSettingState extends State<StateSetting> {
  final _menuFont = const TextStyle(fontSize: 18.0);
  final _subFont = const TextStyle(fontSize: 15.0);
  final _countFont = const TextStyle(fontSize: 18.0, color: Colors.green);
  final _notiFont = const TextStyle(fontSize: 10.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.black12),
      child: ListView(
        //padding: const EdgeInsets.all(16.0),
        children: [
          _oneMenuTile(
            "",
            _emptyIcon(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _emptyEvent,
            ),
          ),
          _divider(10.0),
          Container(
            decoration: new BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Community",
                  style: _menuFont,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5, child: _card("공식카페", "1", "34 new activites")),
                    Expanded(
                        flex: 5, child: _card("갤러리", "3", "127 new activites"))
                  ],
                )
              ],
            ),
          ),
          _divider(10.0),
          _oneMenuTile(
            "Notification",
            _emptyIcon(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _notificationNavi,
            ),
          ),
          _divider(1.0),
          _oneMenuTile(
            "......",
            _emptyIcon(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _emptyEvent,
            ),
          ),
          _divider(1.0),
          _oneMenuTile(
            "..........",
            _emptyIcon(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _emptyEvent,
            ),
          ),
          _divider(10.0),
          _oneMenuTile(
            "dev",
            Icon(Icons.settings),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _developmentNavi,
            ),
          ),
          _divider(10.0),
          _oneMenuTile(
            "Help center",
            Icon(Icons.headset_mic),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _emptyEvent,
            ),
          ),
          _divider(50.0),
        ],
      ),
    );
  }

  Widget _oneMenuTile(final titleWord, final leadIcon, final trailIcon) {
    return ListTile(
      tileColor: Colors.white,
      leading: leadIcon,
      title: Text(
        titleWord,
        style: _menuFont,
      ),
      trailing: trailIcon,
    );
  }

  Widget _card(final name, final count, final noti) {
    return Card(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(name, style: _subFont),
            Icon(Icons.arrow_forward),
          ]),
          _divider(10.0),
          Text(count, style: _countFont),
          _divider(10.0),
          Row(children: [
            Icon(Icons.circle, size: 5, color: Colors.red),
            SizedBox(width: 5),
            Text(noti, style: _notiFont),
          ]),
        ]),
      ),
    );
  }

  void _developmentNavi() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Development'),
              centerTitle: true,
            ),
            body: Container(
              child: Text("Development Page"),
            ),
          );
        },
      ),
    );
  }

  void _notificationNavi() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Notification'),
              centerTitle: true,
            ),
            body: NotificationSetting(),
          );
        },
      ),
    );
  }
}

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  final _menuFont = const TextStyle(fontSize: 18.0);
  final _titleFont = const TextStyle(fontSize: 10.0);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _oneSubTitleTile("SNS"),
      _oneSubMenuTile("인스타", "insta"),
      _oneSubMenuTile("트위터", "twitter"),
      _divider(2.0),
      _oneSubTitleTile("공식카페"),
      _oneSubMenuTile("공지", "cafe-noti"),
      _oneSubMenuTile("이벤트", "cafe-event"),
      _divider(2.0),
      _oneSubTitleTile("브레이브걸스 갤러리"),
      _oneSubMenuTile("공지", "gall-noti"),
      _oneSubMenuTile("모금", "gall-fund"),
      _oneSubMenuTile("이벤트", "gall-event"),
    ]);
  }

  void _toggleNotification(final String name) {
    SettingContainer.notificationStatus[name] =
        SettingContainer.notificationStatus[name] == null
            ? true
            : !SettingContainer.notificationStatus[name];
  }

  Widget _oneSubMenuTile(final titleWord, final name) {
    final onOff = SettingContainer.notificationStatus[name] == null
        ? false
        : SettingContainer.notificationStatus[name];
    return ListTile(
        //minVerticalPadding: 10.0,
        dense: true,
        tileColor: Colors.white,
        leading: _emptyIcon(),
        title: Text(
          titleWord,
          style: _menuFont,
        ),
        trailing: Icon(onOff
            ? Icons.notifications_outlined
            : Icons.notifications_off_outlined),
        onTap: () {
          setState(() {
            _toggleNotification(name);

            print("toggle $onOff $name");
            // OneSignal().sendTag(name, onOff);
          });
        });
  }

  Widget _oneSubTitleTile(final titleWord) {
    return ListTile(
      dense: true,
      tileColor: Colors.white,
      title: Text(
        titleWord,
        style: _titleFont,
      ),
    );
  }
}
