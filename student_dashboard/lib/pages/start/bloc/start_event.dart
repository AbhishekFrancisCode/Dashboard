part of 'start_bloc.dart';

abstract class StartEvent extends Equatable {
  const StartEvent();
  @override
  List<Object> get props => [];
}

class OnLoadStart extends StartEvent {
  const OnLoadStart();
  @override
  List<Object> get props => [];
}

class OnTimePickEvent extends StartEvent {
  final int usage;
  const OnTimePickEvent(this.usage);
  @override
  List<Object> get props => [usage];
}
