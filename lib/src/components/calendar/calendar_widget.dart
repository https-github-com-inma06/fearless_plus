import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key key}) : super(key: key);

  @override
  CalendarWidgetState createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget _calendar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TableCalendar(
        firstDay: DateTime.utc(2016, 1, 1),
        lastDay: DateTime.utc(2070, 12, 31),
        focusedDay: DateTime.now(),
      ),
    );
  }

  Widget _detailSchedule() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text('공식일정'),
          //     Text('기타일정'),
          //   ],
          // ),
          Text('공식일정입니다~~~~~'),
          Text('공식일정입니다~~~~~'),
          Text('공식일정입니다~~~~~'),
          Text('공식일정입니다~~~~~'),
          Text('공식일정입니다~~~~~'),
          Text('공식일정입니다~~~~~'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _calendar(),
            _detailSchedule(),
          ],
        ),
      ),
    );
  }
}
