![codecov](https://codecov.io/gh/Gabanelli/reversible_bloc/branch/main/graph/badge.svg)
[![Version](https://img.shields.io/pub/v/reversible_bloc.svg)](https://pub.dev/packages/reversible_bloc) ![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

A [Bloc](https://pub.dev/packages/bloc) mixin that enables to revert the bloc / cubit to a previous state.

## Usage

To use *reversible_bloc*, you need to import and mix `ReversibleBlocMixin` to your `Bloc` or `Cubit`.

```dart
class MyReversibleCubit extends Cubit<int> with ReversibleBlocMixin {
  MyReversibleCubit(int initialState) : super(initialState);

  void changeValue(int newValue) => emit(newValue);
}
```

Then, when you need to rollback to previous state, you can use `revert()` method.

```dart
final myReversibleCubit = context.read<MyReversibleCubit>();
myReversibleCubit.changeValue(2);
myReversibleCubit.changeValue(4);
// Current state is 4
myReversibleCubit.revert();
// Current state back to 2
myReversibleCubit.revert();
// Current state back to initial state
myReversibleCubit.revert();
// throws EmptyStackException
```

## How to contribute
Feel free to add sugestions and report bugs in [Issues](https://github.com/Gabanelli/reversible_bloc/issues) page. PRs are welcomed too.

## Maintainers

- [Guilherme Gabanelli](https://github.com/Gabanelli)