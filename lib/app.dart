import 'package:bloc_test/stream_test/cubit/cubit/stream_cubit.dart';
import 'package:bloc_test/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/view/counter_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit(),),
      BlocProvider(create: (context) => StreamCubit(),)],
     
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) => MaterialApp(
          home: const CounterPage(),
          theme: theme,
          showPerformanceOverlay: true,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
