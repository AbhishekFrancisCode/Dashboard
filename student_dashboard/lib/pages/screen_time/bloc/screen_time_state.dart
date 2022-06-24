part of 'screen_time_bloc.dart';

abstract class ScreenTimeState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenTimeIntial extends ScreenTimeState {
  final int clasz;
  final int study;
  final int free;
  final int total;
  ScreenTimeIntial(this.clasz, this.study, this.free, this.total);

  @override
  List<Object> get props => [clasz, study, free, total];
}
