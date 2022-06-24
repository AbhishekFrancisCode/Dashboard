part of 'start_bloc.dart';

abstract class StartState extends Equatable {}

class StartIntialState extends StartState {
  StartIntialState();
  @override
  List<Object> get props => [];
}

class StartLoadedState extends StartState {
  final Student student;
  StartLoadedState(this.student);
  @override
  List<Object> get props => [student];
}

class StartError extends StartState {
  final String errorMessage;
  StartError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
