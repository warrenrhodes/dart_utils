import 'package:clock/clock.dart';
import 'package:intl/intl.dart';

/// Extension methods on DateTime to check if a date is today, yesterday, or tomorrow.
extension DateTimeExtensions on DateTime {
  /// Checks if the DateTime instance represents today's date.
  ///
  /// This function compares the year, month, and day of the DateTime instance
  /// with the current date. If all these components match, it returns true.
  ///
  /// Example:
  /// ```dart
  /// DateTime date = DateTime.now();
  /// bool result = date.isToday; // result will be true
  /// ```
  ///
  /// Returns `true` if the date is today, otherwise `false`.
  bool get isToday {
    final now = clock.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Checks if the DateTime instance represents yesterday's date.
  ///
  /// This function subtracts one day from the current date and compares
  /// the year, month, and day of the DateTime instance with the resulting date.
  /// If all these components match, it returns true.
  ///
  /// Example:
  /// ```dart
  /// DateTime date = DateTime.now().subtract(Duration(days: 1));
  /// bool result = date.isYesterday; // result will be true
  /// ```
  ///
  /// Returns `true` if the date is yesterday, otherwise `false`.
  bool get isYesterday {
    final yesterday = clock.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Checks if the DateTime instance represents tomorrow's date.
  ///
  /// This function adds one day to the current date and compares
  /// the year, month, and day of the DateTime instance with the resulting date.
  /// If all these components match, it returns true.
  ///
  /// Example:
  /// ```dart
  /// DateTime date = DateTime.now().add(Duration(days: 1));
  /// bool result = date.isTomorrow; // result will be true
  /// ```
  ///
  /// Returns `true` if the date is tomorrow, otherwise `false`.
  bool get isTomorrow {
    final tomorrow = clock.now().add(Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Checks if the current DateTime instance is in the past.
  ///
  /// Returns `true` if the current DateTime instance represents a moment
  /// before the current date and time as returned by [DateTime.now],
  /// otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2000);
  /// final bool result = dateTime.isInPast();
  /// print(result); // true, since 2000 is in the past
  /// ```
  bool get isInPast => isBefore(clock.now());

  /// Checks if the current DateTime instance is in the future.
  ///
  /// Returns `true` if the current DateTime instance represents a moment
  /// after the current date and time as returned by [DateTime.now],
  /// otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(3000);
  /// final bool result = dateTime.isInFuture();
  /// print(result); // true, since 3000 is in the future
  /// ```
  bool get isInFuture => isAfter(clock.now());

  /// Checks if the current date is between the specified start date and end date.
  ///
  /// Returns `true` if the current date is greater than or equal to the start date
  /// and less than or equal to the end date. Otherwise, returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final startDate = DateTime(2024, 5, 1);
  /// final endDate = DateTime(2024, 5, 31);
  /// final currentDate = DateTime.now();
  ///
  /// final bool result = currentDate.isDateInRange(startDate, endDate);
  /// print(result); // true if currentDate is between May 1 and May 31, 2024
  /// ```
  bool isDateInRange(DateTime startDate, DateTime endDate,
      [DateTime? currentDate]) {
    final currentDateTime = currentDate ?? clock.now();
    return currentDateTime.isAfter(startDate) &&
        currentDateTime.isBefore(endDate);
  }

  /// Returns the localized weekday name.
  ///
  /// The `locale` specifies the desired language and country (e.g., 'en_US' for English in the United States).
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.parse('2024-05-27T14:31:57.505Z');
  /// final weekday = date.localizedWeekday('en_US'); // Returns 'Monday'
  /// print('Today is $weekday');
  /// ```
  String localizedWeekday([String? locale]) {
    final DateFormat formatter = DateFormat(DateFormat.WEEKDAY, locale);

    return formatter.format(this);
  }

  /// Returns the localized month name for the given day number.
  ///
  /// The `dayNumber` should be between 1 (Monday) and 7 (Sunday).
  /// The `locale` specifies the desired language and country (e.g., 'en_US' for English in the United States).
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.parse('2024-05-27T14:31:57.505Z');
  /// final weekday = date.localizedMonth('en_US'); // Returns 'May'
  /// print('Today is $weekday');
  /// ```
  String localizedMonth([String? locale]) {
    final DateFormat formatter = DateFormat(DateFormat.MONTH, locale);

    return formatter.format(this);
  }

  /// Checks if the datetime has passed a specified duration.
  ///
  /// Returns `true` if the current datetime is later than the given duration.
  /// Otherwise, returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.parse('2024-05-27T14:31:57.505Z');
  /// final bool result = date.hasDurationPassed(Duration(hours: 5, minutes: 30));
  /// print(result); // Returns true if the current time is past 20:01:57.505Z on 2024-05-27
  /// ```
  bool hasDurationPassed(Duration duration) {
    return clock.now().isAfter(add(duration));
  }

  /// Adds a specified number of business days.
  ///
  /// The function skips weekends, considering them as non-business days.
  /// It takes into account only Monday to Friday as business days.
  ///
  /// `days`: The number of business days to add.
  ///
  /// Returns a new `DateTime` instance with the added business days.
  ///
  /// Example:
  /// ```dart
  /// final startDate = DateTime(2024, 5, 1);
  /// final resultDate = startDate.addBusinessDays(10);
  /// print(resultDate); // Prints the date after adding 10 business days.
  /// ```

  DateTime addBusinessDays(int days) {
    int totalDays = days;
    DateTime result = this;
    while (totalDays > 0) {
      result = result.add(Duration(days: 1));
      if (result.weekday != DateTime.saturday &&
          result.weekday != DateTime.sunday) {
        totalDays--;
      }
    }
    return result;
  }

  /// Subtracts a specified number of business days.
  ///
  /// The function skips weekends, considering them as non-business days.
  /// It takes into account only Monday to Friday as business days.
  ///
  /// `days`: The number of business days to subtract.
  ///
  /// Returns a new `DateTime` instance with the subtracted business days.
  ///
  /// Example:
  /// ```dart
  /// final endDate = DateTime(2024, 5, 31);
  /// final resultDate = date.subtractBusinessDays(10);
  /// print(resultDate); // Prints the date after subtracting 10 business days.
  /// ```
  DateTime subtractBusinessDays(int days) {
    int totalDays = days;
    DateTime result = this;
    while (totalDays > 0) {
      result = result.subtract(Duration(days: 1));
      if (result.weekday != DateTime.saturday &&
          result.weekday != DateTime.sunday) {
        totalDays--;
      }
    }
    return result;
  }

  /// Returns the first day of the month for a current date.
  ///
  /// Returns a new `DateTime` instance representing the start of the month.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2024, 5, 15);
  /// final startOfMonth = date.startOfMonth;
  /// print(startOfMonth); // Prints 2024-05-01 00:00:00.000
  /// ```
  DateTime get startOfMonth {
    return DateTime(year, month);
  }

  /// Returns the last day of the month for a given date.
  ///
  /// Returns a new `DateTime` instance representing the end of the month.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2024, 5, 15);
  /// final endOfMonth = date.endOfMonth;
  /// print(endOfMonth); // Prints 2024-05-31 23:59:59.999
  /// ```
  DateTime get endOfMonth {
    return DateTime(year, month + 1).subtract(Duration(microseconds: 1));
  }

  /// Determines if the year of a given date is a leap year.
  ///
  /// `year`: The year to be checked.
  ///
  /// Returns `true` if the year is a leap year, otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2024, 5, 15);
  /// final isLeap = date.hasALeapYear;
  /// print(isLeap); // Prints true as 2024 is a leap year.
  /// ```
  bool get hasALeapYear {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }
}
