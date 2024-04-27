part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class LoadingCounterState extends CounterState {}

class IncreaseCounterState extends CounterState {
  final int counter;
  IncreaseCounterState(this.counter);
}

class DecreaseCounterState extends CounterState {
  final int counter;
  DecreaseCounterState(this.counter);
}
