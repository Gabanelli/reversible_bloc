import 'package:bloc/bloc.dart';

import 'stack/stack.dart';

mixin ReversibleMixin<Event, State> on BlocBase<State> {
  late final Stack<State> _stateStack = Stack();

  bool isReverting = false;

  void revert() {
    final oldState = _stateStack.pop();
    isReverting = true;
    emit(oldState);
  }

  @override
  void onChange(Change<State> change) {
    super.onChange(change);
    if (isReverting) {
      isReverting = false;
    } else {
      _stateStack.push(change.currentState);
    }
  }
}