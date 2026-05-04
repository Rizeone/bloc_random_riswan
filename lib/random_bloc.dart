import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class RandomNumberEvent extends Equatable {
  const RandomNumberEvent();

  @override
  List<Object> get props => [];
}

class GenerateRandomNumberEvent extends RandomNumberEvent {}

// States
abstract class RandomNumberState extends Equatable {
  const RandomNumberState();

  @override
  List<Object> get props => [];
}

class RandomNumberInitial extends RandomNumberState {}

class RandomNumberLoading extends RandomNumberState {}

class RandomNumberLoaded extends RandomNumberState {
  final int number;

  const RandomNumberLoaded(this.number);

  @override
  List<Object> get props => [number];
}

class RandomNumberError extends RandomNumberState {
  final String message;

  const RandomNumberError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class RandomNumberBloc extends Bloc<RandomNumberEvent, RandomNumberState> {
  // StreamController for input events
  final _generateRandomController = StreamController<void>();
  // StreamController for output
  final _randomNumberController = StreamController<int>();

  // Input Sink
  Sink<void> get generateRandom => _generateRandomController.sink;
  // Output Stream
  Stream<int> get randomNumber => _randomNumberController.stream;

  RandomNumberBloc() : super(RandomNumberInitial()) {
    _generateRandomController.stream.listen((_) {
      final random = Random().nextInt(10);
      _randomNumberController.sink.add(random);
    });
  }

  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
