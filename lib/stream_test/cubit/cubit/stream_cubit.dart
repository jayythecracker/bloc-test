// stream_cubit.dart
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'stream_state.dart';

class StreamCubit extends Cubit<StreamState> {
  int total = 0;
  String error = '';

  StreamCubit() : super(StreamInitial());

  late StreamSubscription _subscription;

  void repair() async {
    emit(StreamLoading());
    total = 0;
    error = '';
    fetch();
  }

  void fetch() {
    _subscription = Stream.periodic(Duration(seconds: 1)).listen((_) {
      try {
        //  emit(StreamLoading());
        http
            .get(Uri.parse('http://localhost:8080/two/?date=2'))
            .then((response) {
          if (response.statusCode == 200) {
            final newTotal = jsonDecode(response.body)['total'];
            if (newTotal != total) {
              total = newTotal;
              emit(StreamSuccess(total: total));
            }
          } else {
            throw Exception('Failed to load data');
          }
        }).catchError((e) {
          String n = 'Error fetching data: $e';
          if (error != 'Error fetching data: $e') {
            error = n;
               _subscription.cancel();
            emit(StreamFail(error));
          }
        }).timeout(
          Duration(seconds: 3),
          onTimeout: () {
            _subscription.cancel();
            emit(StreamFail('Timeout!!'));
          },
        );
      } catch (e) {
        String n = 'Error fetching data: $e';
        if (error != 'Error fetching data: $e') {
          error = n;
             _subscription.cancel();
          emit(StreamFail(error));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
