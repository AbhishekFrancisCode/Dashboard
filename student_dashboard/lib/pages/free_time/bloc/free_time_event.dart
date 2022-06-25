part of 'free_time_bloc.dart';

abstract class FreeTimeEvent extends Equatable {
  const FreeTimeEvent();

  @override
  List<Object> get props => [];
}

class FreeTimeLoadEvent<T> extends FreeTimeEvent {
  final int usage;
  final int limit;
  FreeTimeLoadEvent(this.usage, this.limit);

  @override
  List<Object> get props => [usage, limit];
}
