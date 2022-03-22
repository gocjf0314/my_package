import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {

  final EdgeInsetsGeometry padding;
  final bool isDateSelect;
  DateTime focusDateTime;
  final OnDaySelected? onDaySelected;

  CustomCalendar({
    this.padding = const EdgeInsets.all(10),
    this.isDateSelect = false,
    required this.focusDateTime,
    this.onDaySelected,
  });
  
  
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: TableCalendar(
        locale: 'ko_KR',
        firstDay: widget.isDateSelect ? DateTime(now.year, now.month, 1) : DateTime(now.year - 1, 1, 1),
        lastDay: DateTime.now().add(const Duration(days: 60)),
        focusedDay: widget.focusDateTime,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        selectedDayPredicate: (day) {
          return isSameDay(widget.focusDateTime, day);
        },
        onDaySelected: widget.onDaySelected
      ),
    );
  }
}
