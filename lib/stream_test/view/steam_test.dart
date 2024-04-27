// steam_test.dart
import 'package:bloc_test/stream_test/cubit/cubit/stream_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SteamTest extends StatelessWidget {
  const SteamTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<StreamCubit>().fetch();
    return Scaffold(
      body: BlocBuilder<StreamCubit, StreamState>(
        builder: (context, state) {
          if (state is StreamSuccess) {
            return Center(
              child: Text(state.total.toString()),
            );
          }
          if (state is StreamFail) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  TextButton.icon(
                      onPressed: ()async {
                        context.read<StreamCubit>().repair();
                      },
                      icon: Icon(Icons.refresh),
                      label: Text('Refresh'))
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
