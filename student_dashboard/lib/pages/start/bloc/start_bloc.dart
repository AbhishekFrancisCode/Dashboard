import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/config.dart';
import 'package:student_dashboard/services/client/failure.dart';

part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(StartInitial()) {
    on<StartEvent>((event, emit) async {
      try {
        await config.initialized;
        emit(StartInitial());
      } on Failure catch (_) {
        emit(const StartError('Error occerd'));
      }
    });
  }
}
