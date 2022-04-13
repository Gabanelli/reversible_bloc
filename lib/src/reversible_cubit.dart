import 'package:bloc/bloc.dart';

import 'reversible_mixin.dart';

class ReversibleCubit<State> extends Cubit<State> with ReversibleMixin {
  ReversibleCubit(State initialState) : super(initialState);
}
