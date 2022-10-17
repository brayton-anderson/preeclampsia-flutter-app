import 'dart:math';

import 'package:intl/intl.dart';

import 'responsive_helper.dart';

class DateConverter {
  
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String slotDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }
  static String isoStringToLocalTimeWithAMPMOnly(String dateTime) {
    return DateFormat('hh:mm a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalTimeWithAmPmAndDay(String dateTime) {
    return DateFormat('hh:mm a, EEE').format(isoStringToLocalDate(dateTime));
  }
  static String stringToStringTime(String dateTime) {
    DateTime inputDate = DateFormat('HH:mm:ss').parse(dateTime);
    return DateFormat('hh:mm a').format(inputDate);
  }
  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }
  static String isoDayWithDateString(String dateTime) {
    return DateFormat('EEE, MMM d, yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String convertTimeRange(String start, String end) {
    DateTime startTime = DateFormat('HH:mm:ss').parse(start);
    DateTime endTime = DateFormat('HH:mm:ss').parse(end);
    return '${DateFormat('hh:mm aa').format(startTime)} - ${DateFormat('hh:mm aa').format(endTime)}';
  }

  static DateTime stringTimeToDateTime(String time) {
    return DateFormat('HH:mm:ss').parse(time);
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      if (diff.inHours > 0) {
        time = '${diff.inHours}h';
      } else if (diff.inMinutes > 0) {
        time = '${diff.inMinutes}m';
      } else if (diff.inSeconds > 0) {
        time = 'now';
      } else if (diff.inMilliseconds > 0) {
        time = 'now';
      } else if (diff.inMicroseconds > 0) {
        time = 'now';
      } else {
        time = 'now';
      }
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      time = '${diff.inDays}d';
    } else if (diff.inDays > 6) {
      time = '${(diff.inDays / 7).floor()}w';
    } else if (diff.inDays > 29) {
      time = '${(diff.inDays / 30).floor()}m';
    } else if (diff.inDays > 365) {
      time = '${date.month} ${date.day}, ${date.year}';
    }
    return time;
  }

   static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));

}
