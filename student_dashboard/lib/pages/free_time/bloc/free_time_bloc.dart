import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'free_time_event.dart';
part 'free_time_state.dart';

//d => dummy
int usaged = 0;
int limitd = 0;

class FreeTimeBloc extends Bloc<FreeTimeEvent, FreeTimeState> {
  FreeTimeBloc() : super(FreeTimeInitial(usaged, limitd)) {
    on<FreeTimeLoadEvent>((event, emit) {
      emit(FreeTimeInitial(event.usage, event.limit));
    });
  }
}
