import 'package:bloc/bloc.dart';

import 'reversible_mixin.dart';

class ReversibleBloc<Event, State> extends Bloc<Event, State> with ReversibleMixin {
  ReversibleBloc(State initialState) : super(initialState);
}