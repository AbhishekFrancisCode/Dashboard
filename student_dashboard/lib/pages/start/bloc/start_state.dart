part of 'start_bloc.dart';

abstract class StartState extends Equatable {
  const StartState();

  @override
  List<Object> get props => [];
}

class StartInitial extends StartState {
  @override
  List<Object> get props => [];
}

class StartError extends StartState {
  final String errorMessage;
  const StartError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
