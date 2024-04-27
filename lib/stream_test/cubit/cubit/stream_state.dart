// stream_state.dart
part of 'stream_cubit.dart';

class StreamState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StreamInitial extends StreamState {}

class StreamLoading extends StreamState {}

class StreamSuccess extends StreamState {
  final int total;

  StreamSuccess({required this.total});

  @override
  List<Object?> get props => [total];
}

class StreamFail extends StreamState {
  final String error;

  StreamFail(this.error);

  @override
  List<Object?> get props => [error];
}
