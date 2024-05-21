import 'package:collection/collection.dart';

/// List extensions.
extension GenericListExtensions<E> on Iterable<E> {
  /// Repeats the list elements.
  List<E> operator *(int data) {
    List<E> result = [];
    for (int i = 0; i < data; i++) {
      result.addAll(this);
    }
    return result;
  }

  /// Concatenates tow list.
  List<E> operator +(List<E> data) {
    return [...this, ...data];
  }

  /// Counts the occurrences of an element in the list, including the map, list
  /// or set.
  int count(E element) {
    DeepCollectionEquality deepEquality = DeepCollectionEquality();
    return where((e) => deepEquality.equals(e, element)).length;
  }
}

extension IntList<T extends num> on Iterable<T> {
  /// A sum element of the iterable.
  ///
  /// The iterable must not be empty.
  num get sum => length == 0
      ? throw StateError('No element')
      : fold(0, (current, next) => current + next);

  /// A average element of the iterable.
  ///
  /// The iterable must not be empty.
  num get average =>
      length == 0 ? throw StateError('No element') : sum / length;

  /// A media of element in the iterable.
  ///
  /// The iterable must not be empty.
  num median() {
    if (length == 0) {
      throw Exception('List is empty');
    }
    var sorted = [...this]..sort();
    if (length % 2 == 0) {
      return (sorted[length ~/ 2 - 1] + sorted[length ~/ 2]) / 2;
    }
    return sorted[length ~/ 2];
  }

  /// A maximal element of the iterable.
  ///
  /// The iterable must not be empty.
  T get max => length == 0
      ? throw StateError('No element')
      : reduce((max, element) => max > element ? max : element);

  /// A minimal element of the iterable.
  ///
  /// The iterable must not be empty.
  T get min => length == 0
      ? throw StateError('No element')
      : reduce((min, element) => min < element ? min : element);
}
