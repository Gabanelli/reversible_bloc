import 'dart:collection';

import 'package:reversible_bloc/src/stack/stack_exceptions.dart';

class Stack<T> {
  final _storage = ListQueue<T>();

  T pop() {
    if (_storage.isEmpty) {
      throw const EmptyStackException();
    }
    return _storage.removeLast();
  }

  void push(T element) {
    _storage.addLast(element);
  }

  int get length => _storage.length;
}