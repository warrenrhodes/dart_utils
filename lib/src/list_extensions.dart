import 'package:collection/collection.dart';

/// List extensions.
extension GenericListExtensions<E> on Iterable<E> {
  /// Returns a new list that contains this list repeated [data] times.
  ///
  /// The [data] argument specifies the number of times the list should be repeated.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3];
  /// List<int> repeatedNumbers = numbers * 3;
  /// print(repeatedNumbers); // Output: [1, 2, 3, 1, 2, 3, 1, 2, 3]
  /// ```
  ///
  /// Returns:
  /// A new list that contains this list repeated [data] times.
  List<E> operator *(int data) {
    List<E> result = [];
    for (int i = 0; i < data; i++) {
      result.addAll(this);
    }
    return result;
  }

  /// Returns a new list that contains the elements of this list followed by the elements of [data].
  ///
  /// The [data] argument specifies the list to concatenate with this list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers1 = [1, 2, 3];
  /// List<int> numbers2 = [4, 5, 6];
  /// List<int> concatenatedNumbers = numbers1 + numbers2;
  /// print(concatenatedNumbers); // Output: [1, 2, 3, 4, 5, 6]
  /// ```
  ///
  /// Returns:
  /// A new list that contains the elements of this list followed by the elements of [data].
  List<E> operator +(List<E> data) {
    return [...this, ...data];
  }

  /// Counts the occurrences of an element in the list, including the map, list
  /// or set.
  ///
  /// The [element] parameter is the element to count the occurrences of.
  ///
  /// Returns an integer representing the number of occurrences.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 2, 1];
  /// print(numbers.count(2)); // Output: 2
  /// ```
  int count(E element) {
    DeepCollectionEquality deepEquality = DeepCollectionEquality();
    return where((e) => deepEquality.equals(e, element)).length;
  }
}

extension IntList<T extends num> on Iterable<T> {
  /// Calculates the sum of all elements in the list.
  ///
  /// If the list is empty, a [StateError] is thrown with the message 'No element'.
  ///
  /// Returns the sum of all elements in the list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3];
  /// print(numbers.sum); // Output: 6
  /// ```
  num get sum => length == 0
      ? throw StateError('No element')
      : fold(0, (current, next) => current + next);

  /// Calculates the average of all elements in the list.
  ///
  /// If the list is empty, a [StateError] is thrown with the message 'No element'.
  ///
  /// Returns the average of all elements in the list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3];
  /// print(numbers.average); // Output: 2.0
  /// ```
  num get average =>
      length == 0 ? throw StateError('No element') : sum / length;

  /// Calculates the median of all elements in the list.
  ///
  /// If the list is empty, an [Exception] is thrown with the message 'List is empty'.
  ///
  /// Returns the median of all elements in the list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4];
  /// print(numbers.median); // Output: 2.5
  /// ```
  num get median {
    if (length == 0) {
      throw Exception('List is empty');
    }
    var sorted = [...this]..sort();
    if (length % 2 == 0) {
      return (sorted[length ~/ 2 - 1] + sorted[length ~/ 2]) / 2;
    }
    return sorted[length ~/ 2];
  }

  /// Returns the maximum value in the list.
  ///
  /// If the list is empty, a [StateError] is thrown with the message 'No element'.
  ///
  /// Returns the maximum value in the list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3];
  /// print(numbers.max); // Output: 3
  /// ```
  T get max => length == 0
      ? throw StateError('No element')
      : reduce((curr, next) => curr > next ? curr : next);

  /// Returns the minimum value in the list.
  ///
  /// If the list is empty, a [StateError] is thrown with the message 'No element'.
  ///
  /// Returns the minimum value in the list.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3];
  /// print(numbers.min); // Output: 1
  /// ```
  T get min => length == 0
      ? throw StateError('No element')
      : reduce((curr, next) => curr < next ? curr : next);
}
