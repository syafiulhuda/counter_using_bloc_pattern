part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBackToZero extends CounterEvent {}
