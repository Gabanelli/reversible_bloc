import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reversible_bloc/reversible_bloc.dart';
import 'package:reversible_bloc/src/stack/empty_stack_exception.dart';

void main() {
  group('Test reversible cubit', () {
    blocTest(
      'when is used in a cubit with int state',
      build: () => _IntTestCubit(0),
      act: (_IntTestCubit cubit) => cubit
        ..increment()
        ..increment()
        ..revert()
        ..increment()
        ..revert()
        ..revert(),
      expect: () => [1, 2, 1, 2, 1, 0],
    );
    blocTest(
      'when is reverted but has no previous state',
      build: () => _IntTestCubit(0),
      act: (_IntTestCubit cubit) => cubit
        ..increment()
        ..revert()
        ..revert(),
        errors: () => [
          isA<EmptyStackException>(),
        ],
    );
  });
}

class _IntTestCubit extends Cubit<int> with ReversibleBlocMixin {
  _IntTestCubit(int initialState) : super(initialState);

  void increment() => emit(state + 1);
}
