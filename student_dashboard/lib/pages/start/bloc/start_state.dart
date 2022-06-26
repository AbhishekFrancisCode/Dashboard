part of 'start_bloc.dart';

abstract class StartState extends Equatable {}

class StartIntialState extends StartState {
  StartIntialState();
  @override
  List<Object> get props => [];
}

class StartLoadedState extends StartState {
  final int clasz;
  final int study;
  final int free;
  final int total;
  final int usage;
  final int limitz;
  final List<Devices> list;
  StartLoadedState(
      {required this.clasz,
      required this.study,
      required this.free,
      required this.total,
      required this.usage,
      required this.limitz,
      required this.list});
  @override
  List<Object> get props => [clasz, study, free, total, usage, limitz, list];
}

class StartError extends StartState {
  final String errorMessage;
  StartError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
