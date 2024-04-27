
import 'package:bloc_test/app.dart';
import 'package:bloc_test/counter_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  Bloc.observer = const CounterObserver();
  runApp( CounterApp());
}