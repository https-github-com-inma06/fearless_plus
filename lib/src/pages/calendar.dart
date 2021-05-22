import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
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
        child: StateCalendar(),
      ),
    );
  }
}

class StateCalendar extends StatefulWidget {
  @override
  _StateCalendarState createState() => _StateCalendarState();
}

class _StateCalendarState extends State<StateCalendar> {
  var _selectedDay;
  var _focusedDay;
  String ASSETS_IMAGES_URI = "assets/images/";
  final List<MockData> list = [
    MockData(
        id: 0,
        title: "test",
        time: "15:00",
        date: "2021-05-20",
        img: "assets/images/testimg.PNG"),
    MockData(
        id: 1,
        title: "test1",
        time: "16:00",
        date: "2021-05-21",
        img: "assets/images/testimg.PNG"),
    MockData(
        id: 2,
        title: "test2",
        time: "17:00",
        date: "2021-05-22",
        img: "assets/images/testimg.PNG")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {

              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              print(_selectedDay.toString());
            });
          },
          focusedDay: DateTime.utc(2021, 05, 21),
          firstDay: DateTime.utc(2010, 3, 14),
          lastDay: DateTime.now(),
        ),
        Expanded(
            child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar(
              tabs: [Tab(text: "공식일정"), Tab(text: "???")],
            ),
            body: TabBarView(
              children: [buildListView(), buildListView()],
            ),
          ),
        ))
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          margin: EdgeInsets.only(top: 8),
          color: Colors.yellowAccent,
          child: Row(
            children: [
              Image.asset(list[index].img),
              Padding(padding: EdgeInsets.only(right: 12)),
              Column(children: [
                Text(list[index].title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(list[index].date)
              ]),
              Padding(padding: EdgeInsets.only(right: 180)),
              Text(list[index].time)
            ],
          ),
        );
      },
    );
  }
}

class MockData {
  final int id;
  final String title;
  final String date;
  final String time;
  final String img;

  MockData({this.id, this.title, this.time, this.date, this.img});
}
