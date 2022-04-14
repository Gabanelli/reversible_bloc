import 'package:bloc/bloc.dart';

import 'stack/stack.dart';

/// A mixin that enables a `Bloc` or a `Cubit` to revert to previous
/// state with `revert()` method.
///
/// Is highly recommended that you use `Equatable` states, because
/// revert uses a comparision between states.
mixin ReversibleBlocMixin<Event, State> on BlocBase<State> {
  late final Stack<State> _stateStack = Stack();
  State? _isRevertingTo;

  /// Reverts to a previous state
  ///
  /// Throws [EmptyStackException] when the stack has
  /// no previous states
  void revert() {
    final oldState = _stateStack.pop();
    _isRevertingTo = oldState;
    emit(oldState);
  }

  @override
  void onChange(Change<State> change) {
    super.onChange(change);
    if (change.nextState == _isRevertingTo) {
      _isRevertingTo = null;
    } else {
      _stateStack.push(change.currentState);
    }
  }
}
