import 'dart:collection';

import 'package:reversible_bloc/src/stack/empty_stack_exception.dart';

/// Data structure used to stack elements
class Stack<T> {
  final _storage = ListQueue<T>();

  /// Get the last item of the stack, removing it
  T pop() {
    if (_storage.isEmpty) {
      throw const EmptyStackException();
    }
    return _storage.removeLast();
  }

  /// Adds a new item in stack, on the last position
  void push(T element) {
    _storage.addLast(element);
  }

  /// Get the stack length
  int get length => _storage.length;
}
