part of 'screen_time_bloc.dart';

abstract class ScreenTimeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ScreenTimeLoadEvent<T> extends ScreenTimeEvent {
  final int clasz;
  final int study;
  final int free;
  final int total;
  ScreenTimeLoadEvent(this.clasz, this.study, this.free, this.total);

  @override
  List<Object> get props => [clasz, study, free, total];
}
