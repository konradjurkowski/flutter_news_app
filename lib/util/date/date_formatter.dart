import 'package:intl/intl.dart';

abstract class DateFormatter {
  String formatDayMonthYear(String? date);
  String formatHourMinute(String? date);
}

class DateFormatterImpl implements DateFormatter {

  @override
  String formatDayMonthYear(String? date) {
    if (date != null) {
      return DateFormat.yMMMd().format(DateTime.parse(date));
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(DateTime.now().toString()));
    }
  }

  @override
  String formatHourMinute(String? date) {
    if (date != null) {
      return DateFormat.Hm().format(DateTime.parse(date));
    } else {
      return DateFormat.Hm().format(DateTime.parse(DateTime.now().toString()));
    }
  }
}