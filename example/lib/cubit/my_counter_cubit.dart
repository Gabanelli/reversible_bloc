import 'package:bloc/bloc.dart';
import 'package:reversible_bloc/reversible_bloc.dart';

class MyCounterCubit extends Cubit<int> with ReversibleBlocMixin {
  MyCounterCubit() : super(0);

  void increment() => emit(state + 1);
  
}