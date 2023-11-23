import 'package:intl/intl.dart';
import 'package:my_books_to_read/generated/l10n.dart';

abstract class DateFormats {
  static String fullDateTime(DateTime date) {
    final formatter = DateFormat('dd.MM.yyyy, hh:mm');
    final result = formatter.format(date.toLocal());
    return result;
  }

  static String fullDate(DateTime date) {
    final formatter = DateFormat('dd.MM.yyyy');
    final result = formatter.format(date.toLocal());
    return result;
  }

  static String dayMonthName(DateTime date) {
    final formatter = DateFormat('dd MMMM');
    final result = formatter.format(date.toLocal());
    return result;
  }

  static String time(DateTime date) {
    final formatter = DateFormat('HH:mm');
    final result = formatter.format(date.toLocal());
    return result;
  }

  static String todayYesterday(DateTime date) {
    final now = DateTime.now().toLocal();
    final yesterday = now.subtract(const Duration(days: 1));
    final difference = now.difference(date.toLocal());

    if (difference.inHours < 24 && now.day == date.day) {
      return S.current.today;
    } else if (difference.inHours < 48 && yesterday.day == date.day) {
      return S.current.yesterday;
    } else if (difference.inDays < 365) {
      return dayMonthName(date);
    } else {
      return fullDate(date);
    }
  }

  static String todayYesterdayFullDateTime(DateTime date) {
    final now = DateTime.now().toLocal();
    final yesterday = now.subtract(const Duration(days: 1));
    final tomorrow = now.add(const Duration(days: 1));
    final difference = now.difference(date.toLocal());

    if (difference.inHours < 24 && now.day == date.day) {
      return '${S.current.today}, ${time(date)}';
    } else if (difference.inHours < 48 && yesterday.day == date.day) {
      return '${S.current.yesterday}, ${time(date)}';
    } else if (difference.inHours.abs() < 24 && tomorrow.day == date.day) {
      return '${S.current.tomorrow}, ${time(date)}';
    } else {
      return '${fullDate(date)}, ${time(date)}';
    }
  }

  static String todayYesterdayWithTime(DateTime date) {
    return '${todayYesterday(date)} ${time(date)}';
  }
}
