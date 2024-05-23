Sure! Here's a sample `README.md` for your `Dart utils` package that extends the List and String functionalities:

---

# Dart Utils

A Dart package providing powerful extensions for `List` and `String` objects, inspired by Python's rich set of list and string methods. This package aims to enhance the functionality of Dart collections and strings, making common operations easier and more intuitive.

## Features

### List Extensions
- **extend**: Extend a list with elements from another list.
- **count**: Count the occurrences of an element in the list.
- **removeAll**: Remove all occurrences of an element from the list.
- **sum**: Calculate the sum of elements in the list.
- **product**: Calculate the product of elements in the list.
- **average**: Calculate the average of elements in the list.
- **min**: Find the minimum value in the list.
- **max**: Find the maximum value in the list.
- **flatten**: Flatten a list of lists.
- **unique**: Get a list of unique elements.
- **groupBy**: Group elements by a key.

### String Extensions
- **capitalize**: Capitalize the first character of the string.
- **center**: Center the string within a specified width.
- **count**: Count the number of occurrences of a substring.
- **find**: Find the first occurrence of a substring.
- **rfind**: Find the last occurrence of a substring.
- **isnumeric**: Check if all characters in the string are numeric.
- **ljust**: Left-justify the string within a specified width.
- **rjust**: Right-justify the string within a specified width.
- **partition**: Split the string at the first occurrence of a separator.
- **rpartition**: Split the string at the last occurrence of a separator.
- **splitlines**: Split the string

# Dart Utils

A Dart package providing powerful extensions for `List` and `String` objects, inspired by Python's rich set of list and string methods. This package aims to enhance the functionality of Dart collections and strings, making common operations easier and more intuitive.

## Features

### List Extensions

- **extend**: Extend a list with elements from another list.
- **count**: Count the occurrences of an element in the list.
- **removeAll**: Remove all occurrences of an element from the list.
- **sum**: Calculate the sum of elements in the list.
- **product**: Calculate the product of elements in the list.
- **average**: Calculate the average of elements in the list.
- **min**: Find the minimum value in the list.
- **max**: Find the maximum value in the list.
- **flatten**: Flatten a list of lists.
- **unique**: Get a list of unique elements.
- **groupBy**: Group elements by a key.

### String Extensions

- **capitalize**: Capitalize the first character of the string.
- **center**: Center the string within a specified width.
- **count**: Count the number of occurrences of a substring.
- **find**: Find the first occurrence of a substring.
- **rfind**: Find the last occurrence of a substring.
- **isNumeric**: Check if all characters in the string are numeric.
- **ljust**: Left-justify the string within a specified width.
- **rjust**: Right-justify the string within a specified width.
- **partition**: Split the string at the first occurrence of a separator.
- **rpartition**: Split the string at the last occurrence of a separator.
- **splitlines**: Split the string at line breaks.
- **zfill**: Pad the string with zeros on the left.
- **isPalindrome**: Check if the string is a palindrome.
- **capitalizeWords**: Capitalize the first letter of each word in the string.
- **swapCase**: Swap the case of all letters in the string.
- **removePunctuation**: Remove all punctuation from the string.
- **toTitleCase**: Convert the string to title case.
- **repeat**: Repeat the string a specified number of times.
- **containsIgnoreCase**: Check if the string contains another string, ignoring case.
- **removeWhitespaces**: Remove all whitespaces from the string.
- **containsOnlyLetters**: Check if the string contains only letters.
- **containsOnlyDigits**: Check if the string contains only digits.
- **containsOnlyWhitespace**: Check if the string contains only whitespace characters.
- **stripHtml**: Remove HTML tags from the string.

## Usage

### List Extensions

```dart
import 'package:dart_utils/dart_utils.dart';

void main() {
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  list1.extend(list2);
  print(list1); // Output: [1, 2, 3, 4, 5, 6]

  List<int> numbers = [1, 2, 2, 3, 4];
  print(numbers.count(2)); // Output: 2
  numbers.removeAll(2);
  print(numbers); // Output: [1, 3, 4]
  print(numbers.sum()); // Output: 8
  print(numbers.product()); // Output: 12
  print(numbers.average()); // Output: 2.6666666666666665
  print(numbers.min()); // Output: 1
  print(numbers.max()); // Output: 4

  List<List<int>> nestedList = [[1, 2], [3, 4], [5, 6]];
  print(nestedList.flatten()); // Output: [1, 2, 3, 4, 5, 6]

  List<int> duplicates = [1, 2, 2, 3, 3, 3];
  print(duplicates.unique()); // Output: [1, 2, 3]

  List<String> words = ["apple", "banana", "apricot"];
  print(words.groupBy((word) => word[0])); // Output: {a: [apple, apricot], b: [banana]}
}
```

### String Extensions

```dart
import 'package:dart_utils/dart_utils.dart';

void main() {
  String text = "hello world";

  print(text.capitalize()); // Output: "Hello world"
  print(text.center(20, '-')); // Output: "----hello world-----"
  print(text.count('o')); // Output: 2
  print(text.find('world')); // Output: 6
  print(text.rfind('o')); // Output: 7
  print('12345'.isNumeric()); // Output: true
  print(text.ljust(15, '-')); // Output: "hello world----"
  print(text.rjust(15, '-')); // Output: "----hello world"
  print(text.partition(' ')); // Output: ["hello", " ", "world"]
  print(text.rpartition(' ')); // Output: ["hello", " ", "world"]
  print("line1\nline2".splitlines()); // Output: ["line1", "line2"]
  print('42'.zfill(5)); // Output: "00042"

  String palindrome = "A man, a plan, a canal, Panama";
  print(palindrome.isPalindrome()); // Output: true

  String sentence = "hello world";
  print(sentence.capitalizeWords()); // Output: "Hello World"

  String mixedCase = "Hello World";
  print(mixedCase.swapCase()); // Output: "hELLO wORLD"

  String punctuation = "Hello, world!";
  print(punctuation.removePunctuation()); // Output: "Hello world"

  String title = "hello world";
  print(title.toTitleCase()); // Output: "Hello World"

  String repeatText = "repeat";
  print(repeatText.repeat(3)); // Output: "repeatrepeatrepeat"

  String haystack = "Hello World";
  print(haystack.containsIgnoreCase("hello")); // Output: true

  String spaces = " h e l l o ";
  print(spaces.removeWhitespaces()); // Output: "hello"

  String letters = "letters";
  print(letters.containsOnlyLetters()); // Output: true

  String digits = "123456";
  print(digits.containsOnlyDigits()); // Output: true

  String whitespace = "    ";
  print(whitespace.containsOnlyWhitespace()); // Output: true

  String html = "<p>This is <b>HTML</b> content</p>";
  print(html.stripHtml()); // Output: "This is HTML content"
}
```

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  dart_utils:
    git:
      url: https://github.com/yourusername/dart_utils.git
```

Then run `flutter pub get` or `dart pub get` to install the package.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This `README.md` provides an overview of the features, usage examples, installation instructions, and contribution guidelines for your `Dart utils` package.