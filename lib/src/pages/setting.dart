import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          _oneMenuTile("", _emptyIcon()),
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
          _oneMenuTile("Notification", _emptyIcon()),
          _divider(1.0),
          _oneMenuTile("......", _emptyIcon()),
          _divider(1.0),
          _oneMenuTile("..........", _emptyIcon()),
          _divider(10.0),
          _oneMenuTile("..........", Icon(Icons.settings)),
          _divider(10.0),
          _oneMenuTile("Help center", Icon(Icons.headset_mic)),
          _divider(50.0),
        ],
      ),
    );
  }

  Widget _oneMenuTile(final titleWord, final icon) {
    return ListTile(
      tileColor: Colors.white,
      leading: icon,
      title: Text(
        titleWord,
        style: _menuFont,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _divider(final thickness) {
    return SizedBox(height: thickness);
  }

  Icon _emptyIcon() {
    return Icon(Icons.no_cell, color: Colors.white);
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
}
