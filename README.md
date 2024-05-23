# Dart Advanced Utils Package

## Overview

The **Dart Advanced Utils** package enhances the default dart object by adding powerful and flexible methods. Inspired by Python's versatile, this package introduces extensions that make working with object in Dart more intuitive and concise.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  dart_advanced_utils: ^1.0.0
```

Run `pub get` to install the package.

## Usage

Import the package in your Dart code:

```dart
import 'package:dart_advanced_utils/dart_advanced_utils.dart';
```

## Features

### List Extensions
- **Operator***: Returns a new list that contains this list repeated [n] times.
- **Operator+**: Concatenate two list.
- **count**: Count the occurrences of an element in the list.
- **sum**: Calculate the sum of elements in the list.
- **average**: Calculate the average of elements in the list.
- **median**: Calculates the median of all elements in the list.
- **min**: Find the minimum value in the list.
- **max**: Find the maximum value in the list.

### String Extensions
- **capitalize**: Capitalize the first character of the string.
- **center**: Center the string within a specified width.
- **count**: Count the number of occurrences of a substring.
- **isnumeric**: Check if all characters in the string are numeric.
- **ljust**: Left-justify the string within a specified width.
- **rjust**: Right-justify the string within a specified width.
- **isValidEmail**: hecks if the current string is a valid email address.
- **isAlphanumeric**: Checks if the current string is alphanumeric.
- **isBlank**: Checks if the current string is blank.
- **reverse**: Reverses the order of the characters in the string.
- **toCamelCase**: Converts a string to camel case.
- **toKebabCase**: Converts a string to kebab case.
- **isLow**: Whether the string is lowercase case or not.
- **isUpper**: Whether the string is uppercase case or not.
- **strip**: Returns a new string with leading and trailing characters removed.
- **title**: Returns a new string with the first letter of each word capitalized and all other letters lowercased.
- **charToUpper**: Returns a new string with the character at the specified [index] capitalized.

### Examples

```dart
import 'package:dart_advanced_utils/dart_advanced_utils.dart';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  print(numbers.max); // Output: 10
  print(numbers.min); // Output: 1

  List repeatedList = [54] * 3;
  print(repeatedList); // Output: [54, 54, 54]

  String? email = "example@example.com";
  print(email.isValidEmail()); // Output: true

  String? number = "12345";
  print(number.isNumeric); // Output: true

  String? alphanumeric = "abc123";
  print(alphanumeric.isAlphanumeric()); // Output: true

  String? blankString = "   ";
  print(blankString.isBlank); // Output: true

}
```


## Contributing

If you find any issues or have suggestions for new features, please create an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License.

---

With these extensions, the **Dart Advanced Utils** package aims to provide a comprehensive set of tools to enhance your Dart development experience, making common list operations more intuitive and powerful.
