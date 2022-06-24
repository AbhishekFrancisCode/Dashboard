import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'screen_time_event.dart';
part 'screen_time_state.dart';

int claszd = 0;
int studyd = 0;
int freed = 0;
int totald = 0;

class ScreenTimeBloc extends Bloc<ScreenTimeEvent, ScreenTimeState> {
  ScreenTimeBloc() : super(ScreenTimeIntial(claszd, studyd, freed, totald)) {
    on<ScreenTimeLoadEvent>((event, emit) {
      emit(ScreenTimeIntial(event.clasz, event.study, event.free, event.total));
    });
  }
}
