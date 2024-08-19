// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));

    on<CounterDecrementPressed>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });

    on<CounterBackToZero>((event, emit) => emit(state - state));
  }
}
