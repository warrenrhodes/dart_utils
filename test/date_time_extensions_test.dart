import 'package:clock/clock.dart';
import 'package:dart_advanced_utils/src/date_time_extensions.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test/test.dart';

void main() {
  group('DateTimeExtensions', () {
    test('get localized weekday', () async {
      await initializeDateFormatting();

      final date = DateTime.parse('2024-05-27T14:31:57.505Z');
      expect(date.localizedWeekday(), 'Monday');
    });
    test('get localized monday', () async {
      await initializeDateFormatting();

      final date = DateTime.parse('2024-05-27T14:31:57.505Z');
      expect(date.localizedMonth(), 'May');
      expect(date.localizedMonth('fr_FR'), 'mai');
    });
    test('hasDurationPassed', () async {
      await initializeDateFormatting();
      await withClock(
        Clock.fixed(DateTime.parse('2024-05-30 22:31:00Z').toUtc()),
        () async {
          final date = DateTime.parse('2024-05-27T14:31:57.505Z');
          expect(
              date.hasDurationPassed(Duration(days: 3, hours: 5, minutes: 00)),
              true);
        },
      );
    });
    test('addBusinessDays', () async {
      await initializeDateFormatting();
      await withClock(
        Clock.fixed(DateTime.parse('2024-05-30 22:31:00Z').toUtc()),
        () async {
          final date = DateTime.parse('2024-05-30T14:31:57.505Z');
          expect(date.addBusinessDays(2),
              DateTime.parse('2024-06-03 14:31:57.505Z'));
        },
      );
    });
  });
}
