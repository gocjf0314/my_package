import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_network_cache_image.dart';

class CalendarDialog extends StatefulWidget {

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {

  late DateTime chooseDateTime;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  @override
  void initState() {
    super.initState();
    chooseDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        children: [
          yearImage(chooseDateTime) == null ? Container() : NCImage(url: yearImage(chooseDateTime),),
          TableCalendar(
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              rangeHighlightColor: Colors.orange.shade100,
              rangeStartDecoration: BoxDecoration(
                color: Colors.orange.shade300,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: BoxDecoration(
                color: Colors.orange.shade300,
                shape: BoxShape.circle,
              ),
              todayDecoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            rowHeight: 50,
            locale: 'ko_KR',
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: chooseDateTime,
            formatAnimationCurve: Curves.fastOutSlowIn,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onPageChanged: (focusedDay) {
              setState(() => chooseDateTime = focusedDay);
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(() {
                _selectedDay = null;
                _focusedDay = focusedDay;
                _rangeStart = start;
                _rangeEnd = end;
                _rangeSelectionMode = RangeSelectionMode.toggledOn;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              null;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('초기화'),
          onPressed: () => Navigator.of(context).pop(['', '']),
        ),
        TextButton(
            child: Text('선택'),
            onPressed: () {
              if(_rangeEnd == null){
                Navigator.of(context).pop([
                  _rangeStart, _rangeStart!.add(Duration(days: 1))
                ]);
              } else {
                Navigator.of(context).pop([
                  _rangeStart, _rangeEnd
                ]);
              }
            }
        ),
      ],
    );
  }

  yearImage(DateTime? dateTime) {
    switch(dateTime!.year){
      case 2020 : return 'https://t1.daumcdn.net/cfile/tistory/9961C83B5DFF13FF2D';
      case 2021 : return 'https://t3.ftcdn.net/jpg/00/98/60/84/360_F_98608482_JupJYdpfaVUXi4IJ6VSD3ZgUyCfNP19Z.jpg';
      case 2022 : return 'https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F246BF1465850019D2A';
      case 2023 : return 'https://thumb.ac-illust.com/4f/4f807f334e11cad86922d72ff6a66b18_t.jpeg';
      case 2024 : return 'https://mblogthumb-phinf.pstatic.net/MjAxOTEwMjJfMTcg/MDAxNTcxNzAyMjI5NDE0.DcyTqK7NHxgfG7k04mbGV5KNofCimrLD8DC5wlsYBhog.C9UPgQEQQmi_W1uPqecz7LAHPmFYHDn5y6mcR5lm9hwg.JPEG.pil/Dragon_Illustration_Tattoo_Design_%EA%B1%B4%EB%8C%80%ED%83%80%ED%88%AC_%EB%AC%B8%EC%8B%A0%EB%8F%84%EC%95%88_%EC%9A%A9%EB%AC%B8%EC%8B%A0_01.jpg?type=w800';
      default : return null;
    }
  }
}