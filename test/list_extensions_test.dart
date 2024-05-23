import 'package:dart_advanced_utils/src/list_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Generic List extension tests', () {
    test('Test the repeat operator', () {
      List<List<int>> emptyList = [[]];
      List<List<int>> repeatedList = emptyList * 3;
      List repeatedList2 = [54] * 3;

      expect(repeatedList, [[], [], []]);
      expect(repeatedList2, [54, 54, 54]);
    });

    test('Concatenates tow list', () {
      List<int> list_1 = [1, 2];
      List<int> list_2 = [3, 4];

      expect(list_1 + list_2, [1, 2, 3, 4]);
    });

    test('Count the number of element', () {
      Map<String, dynamic> mapToTest = {
        "name": "John Doe",
        "age": 30,
        "address": {"street": "123 Main St", "city": "Anytown"},
      };
      Map<String, dynamic> map2 = {
        "name": "John Doe",
        "age": 30,
        "address": {"street": "123 Main St", "city": "Anytown"},
      };
      List<dynamic> listOfList = [
        [1, 2],
        [1, 2],
        [1, 4],
        [9, 4],
        2
      ];

      List<dynamic> listOfInt = [1, 3, 2, 5, 6, 2, 2];
      List<dynamic> listOfMap = [
        map2,
        {"key": "value"},
      ];
      expect(listOfList.count([1, 2]), 2);
      expect(listOfMap.count(mapToTest), 1);
      expect(listOfInt.count(2), 3);
    });
  });
  group('IntList Extension Tests', () {
    test('sum of non-empty iterable', () {
      var numbers = [1, 2, 3, 4, 5];
      expect(numbers.sum, equals(15));
    });

    test('average of non-empty iterable', () {
      var numbers = [1, 2, 3, 4, 5];
      expect(numbers.average, closeTo(3, 0.01));
    });

    test('median of odd-length iterable', () {
      var numbers = [1, 2, 3, 4, 5];
      expect(numbers.median(), equals(3));
    });

    test('median of even-length iterable', () {
      var numbers = [1, 2, 3, 4];
      expect(numbers.median(), equals(2.5));
    });

    test('max of non-empty iterable', () {
      var numbers = [1, 2, 3, 4, 5];
      expect(numbers.max, equals(5));
    });

    test('min of non-empty iterable', () {
      var numbers = [1, 2, 3, 4, 5];
      expect(numbers.min, equals(1));
    });

    test('empty iterable throws StateError', () {
      List<int> numbers = [];
      expect(() => numbers.sum, throwsA(isA<StateError>()));
      expect(() => numbers.average, throwsA(isA<StateError>()));
      expect(() => numbers.median(), throwsA(isA<Exception>()));
      expect(() => numbers.max, throwsA(isA<StateError>()));
      expect(() => numbers.min, throwsA(isA<StateError>()));
    });
  });
}
