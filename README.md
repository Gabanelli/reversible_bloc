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

## MIT License
```
Copyright (c) 2022 Gabanelli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```