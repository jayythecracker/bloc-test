import 'package:bloc_test/counter/counter.dart';
import 'package:bloc_test/stream_test/view/steam_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/cubit/theme_cubit.dart';
import '../cubit/counter_cubit.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if (state is LoadingCounterState) {
              return CircularProgressIndicator();
            }
            if (state is IncreaseCounterState) {
              return Text("${state.counter}", style: textTheme.displayMedium);
            }
            if (state is DecreaseCounterState) {
              return Text("${state.counter}", style: textTheme.displayMedium);
            }
            return Text("0", style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'next',
            child: const Icon(Icons.skip_next),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SteamTest())),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'inc',
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increase(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'dec',
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrease(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'theme',
            key: const Key('theme_switch_floatingActionButton'),
            child: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ],
      ),
    );
  }
}
