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
    on<OnLoadStart>((event, emit) async {
      try {
        await config.initialized;
        final response = await RemoteRepository().getStudentData();
        emit(StartLoadedState(response.data));
      } on Failure catch (_) {
        emit(StartError('Error occerd'));
      }
    });
  }
}
