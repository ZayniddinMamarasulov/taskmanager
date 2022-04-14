import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyDay extends StatefulWidget {
  const MyDay({Key? key}) : super(key: key);

  @override
  _MyDayState createState() => _MyDayState();
}

class _MyDayState extends State<MyDay> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}
