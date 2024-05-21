# Dart Utils Package

## Overview

The **Dart Utils** package enhances the default dart object by adding powerful and flexible methods. Inspired by Python's versatile, this package introduces extensions that make working with object in Dart more intuitive and concise.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  dart_utils: ^1.0.0
```

Run `pub get` to install the package.

## Usage

Import the package in your Dart code:

```dart
import 'package:dart_utils/dart_utils.dart';
```

### Examples

#### Repeat data of list

```dart
void main() {
  List<int> list1 = [1] * 3;
  print(list); // Output: [1, 1, 1]
}
```

#### Count Occurrences

```dart
void main() {
  List<dynamic> listOfList = [[1,2], [1,2], [1,4], [9,4], 2];
  print(listOfList.count([1,2])); // Output: 2
}
```

#### Concat two list

```dart
void main() {
  List<int> list = [1] + [3];
  print(list); // Output: [1,3]
}
```

## Contributing

If you find any issues or have suggestions for new features, please create an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License.

---

With these extensions, the **Dart Utils** package aims to provide a comprehensive set of tools to enhance your Dart development experience, making common list operations more intuitive and powerful.
