import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reversible_bloc/reversible_bloc.dart';

void main() {
  group('Test reversible bloc', () {
    blocTest(
      'when is used in a bloc',
      build: () => _TestBloc(const _TestInitialState()),
      act: (_TestBloc cubit) async {
        cubit
          ..add(_IncrementEvent(5))
          ..add(_IncrementEvent(10));
        await Future.delayed(const Duration(milliseconds: 1));
        cubit
          ..revert()
          ..revert();
      },
      expect: () => [
        const _TestValueState(5),
        const _TestValueState(15),
        const _TestValueState(5),
        const _TestInitialState(),
      ],
    );
  });
}

class _TestBloc extends ReversibleBloc<_TestEvent, _TestState> {
  _TestBloc(_TestState initialState) : super(initialState) {
    on<_IncrementEvent>(
        (event, emit) => emit(_TestValueState(state.value + event.value)));
  }
}

abstract class _TestState extends Equatable {
  final int value;
  const _TestState(this.value);
}

class _TestInitialState extends _TestState {
  const _TestInitialState() : super(0);

  @override
  List<Object?> get props => [value];
}

class _TestValueState extends _TestState {
  const _TestValueState(int value) : super(value);

  @override
  List<Object?> get props => [value];
}

abstract class _TestEvent extends Equatable {}

class _IncrementEvent extends _TestEvent {
  final int value;

  _IncrementEvent(this.value);

  @override
  List<Object?> get props => [value];
}
