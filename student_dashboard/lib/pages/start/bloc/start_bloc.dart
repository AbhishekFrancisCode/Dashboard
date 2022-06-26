import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/config.dart';
import 'package:student_dashboard/model/student.dart';
import 'package:student_dashboard/services/client/failure.dart';
import 'package:student_dashboard/services/client/remote_repository.dart';
import 'dart:developer' as devtools show log;

part 'start_event.dart';
part 'start_state.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(StartIntialState()) {
    int claszd = 0;
    int studyd = 0;
    int freed = 0;
    int totald = 0;
    int usaged = 0;
    int limitd = 0;
    List<Devices> listd = [];
    on<OnLoadStart>((event, emit) async {
      try {
        await config.initialized;
        final response = await RemoteRepository().getStudentData();
        final needData = response.data.data;
        claszd = needData!.screenTime!.clasz!;
        studyd = needData.screenTime!.study!;
        freed = needData.screenTime!.free!;
        totald = needData.screenTime!.total!;
        usaged = needData.freeTime!.usage!;
        limitd = needData.freeTime!.limit!;
        listd = needData.devices!;

        emit(StartLoadedState(
          clasz: claszd,
          study: studyd,
          free: freed,
          total: totald,
          usage: usaged,
          limitz: limitd,
          list: listd,
        ));
      } on Failure catch (_) {
        emit(StartError('Error occerd'));
      }
    });
    on<OnTimePickEvent>((event, emit) async {
      try {
        if (state is StartLoadedState) {
          emit(StartLoadedState(
              clasz: claszd,
              study: studyd,
              free: event.usage,
              total: totald + event.usage,
              usage: event.usage,
              limitz: limitd,
              list: listd));
        }
      } on Failure catch (_) {
        emit(StartError('Error occerd'));
      }
    });
  }
}
