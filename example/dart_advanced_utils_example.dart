import 'package:dart_advanced_utils/dart_advanced_utils.dart';
import 'package:dart_advanced_utils/src/custom_func.dart';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  print(numbers.max); // Output: 10
  print(numbers.min); // Output: 1

  List repeatedList = [54] * 3;
  print(repeatedList); // Output: [54, 54, 54]

  String? email = "example@example.com";
  print(email.isValidEmail); // Output: true

  String? number = "12345";
  print(number.isNumeric); // Output: true

  String? alphanumeric = "abc123";
  print(alphanumeric.isAlphanumeric); // Output: true

  String? blankString = "   ";
  print(blankString.isBlank); // Output: true

  print(numbers.prod); // Output: 3628800

  String str = 'Hello {0}, my name is {1}';
  String str2 = 'Hello {}, my name is {}';
  print(str.format(
      posArgs: ['Dart', 'John'])); // Output: Hello Dart, my name is John.
  print(str2.format(
      posArgs: ['Jhon', 'Smith'])); //Output: Hello Jhon, my name is Smith.

  final iterable = ['value1', 'value2'];
  fprint(iterable, unpack: true); // Output: value1 value2
}
