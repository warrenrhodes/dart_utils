import 'package:collection/collection.dart';

/// List extensions.
extension ListExtensions<E> on List<E> {
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
