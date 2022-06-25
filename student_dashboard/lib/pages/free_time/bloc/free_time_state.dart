part of 'free_time_bloc.dart';

abstract class FreeTimeState extends Equatable {
  @override
  List<Object> get props => [];
}

class FreeTimeInitial extends FreeTimeState {
  final int usage;
  final int limit;
  FreeTimeInitial(
    this.usage,
    this.limit,
  );

  @override
  List<Object> get props => [
        usage,
        limit,
      ];
}
