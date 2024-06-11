import 'package:dart_advanced_utils/src/custom_func.dart';
import 'package:test/test.dart';

void main() {
  group('fprint', () {
    test('should print a map with unpacked keys', () {
      final map = {'key1': 'value1', 'key2': 'value2'};
      final expectedOutput = 'key1 key2';

      expect(() => fprint(map, unpack: true), prints('$expectedOutput\n\n'));
    });

    test('should print a map with string representation', () {
      final map = {'key1': 'value1', 'key2': 'value2'};
      final expectedOutput = '{key1: value1, key2: value2}';

      expect(() => fprint(map), prints('$expectedOutput\n\n'));
    });

    test('should print an iterable with unpacked elements', () {
      final iterable = ['value1', 'value2'];
      final expectedOutput = 'value1 value2';

      output() => fprint(iterable, unpack: true);

      expect(output, prints('$expectedOutput\n\n'));
    });

    test(
        'should print an iterable with unpacked elements and string representation',
        () {
      final iterable = ['value1', 'value2'];
      final expectedOutput = 'value1-value2';

      output() => fprint(iterable, unpack: true, sep: '-');

      expect(output, prints('$expectedOutput\n\n'));
    });

    test('should print an iterable with string representation', () {
      final iterable = ['value1', 'value2'];
      final expectedOutput = '[value1, value2]';

      output() => fprint(iterable);

      expect(output, prints('$expectedOutput\n\n'));
    });

    test('should print a single value', () {
      final value = 'value';
      final expectedOutput = 'value';

      output() => fprint(value);

      expect(output, prints('$expectedOutput\n\n'));
    });
  });
}
