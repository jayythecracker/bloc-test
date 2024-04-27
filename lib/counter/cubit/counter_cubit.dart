import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;
  CounterCubit() : super(CounterInitial());
  void increase() async {
    emit(LoadingCounterState());
    await Future.delayed(Duration(seconds: 1));

    counter++;
    
    emit(IncreaseCounterState(counter));
  }

  void decrease() async {
    emit(LoadingCounterState());
    await Future.delayed(Duration(seconds: 1));
    if (counter > 0) {
      counter--;
    }
    

    emit(DecreaseCounterState(counter));
  }
}
