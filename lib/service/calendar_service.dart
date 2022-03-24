import 'package:intl/intl.dart';

class CalenderControllerService {

  DateTime focusDateTime = DateTime.now();
  DateTime selectDateTime = DateTime.now();

  void initState() {
    focusDateTime = DateTime.now();
    selectDateTime = DateTime.now();
  }

}

/// Base Data of Calendar
Map<int, String> dayOfWeekList = {
  1: '월',
  2: '화',
  3: '수',
  4: '목',
  5: '회',
  6: '토',
  7: '금',
};

/// Date Control Functions
String timeToString(int n) {
  if(n >= 10){return '${n}';}
  return '0${n}';
}

String hmToString(int hour, int minute) => '${timeToString(hour)}:${timeToString(minute)}';

DateTime dateTimeParsing({String? dateTime, int? year, int? month, int? day, int? hour, int? minute}) {
  if(dateTime == null && year != null && month != null && day != null) {
    if(hour != null && minute != null) {
      return DateTime.parse('${year}-${timeToString(month)}-${timeToString(day)} ${hmToString(hour, minute)}');
    }
    return DateTime.parse('${year}-${timeToString(month)}-${timeToString(day)}');
  }
  return DateTime.parse(dateTime!);
}

String dateTimeFormat(DateTime dateTime) {
  String date = DateFormat('yyyy-MM-dd').format(dateTime);
  return date;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime(first.year, first.month, first.day + index),
  );
}

// Map<String, List<String>>? setPickedDateTimeList({
//   List<DateTime>? pickedDateTimeList,
//   List<ScheduleModel>? scheduleList,
// }) {
//   Map<String, List<String>> setVisitTime = {};
//   pickedDateTimeList!.forEach((pickedDateTime) {
//     String? day = pickedDateTime.day.toString();
//     String? dayOfWeek = dayOfWeekList[pickedDateTime.weekday];
//     List<String> activeTimeList = [];
//     scheduleList!.forEach((scheduleModel) {
//       if(pickedDateTime.day == scheduleModel.day && pickedDateTime.month == scheduleModel.month && pickedDateTime.year == scheduleModel.year){
//         scheduleModel.scheduleData!.forEach((scheduleData) {
//           if(scheduleData.state! && !scheduleData.select!) {
//             activeTimeList.add(hmToString(scheduleData.hour!, scheduleData.minute!));
//           }
//         });
//         setVisitTime['${day}일 ${dayOfWeek}요일'] = activeTimeList;
//       }
//     });
//   });
//   return setVisitTime;
// }