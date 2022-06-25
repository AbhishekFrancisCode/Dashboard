import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/model/student.dart';

part 'device_lists_event.dart';
part 'device_lists_state.dart';

class DeviceListsBloc extends Bloc<DeviceListsEvent, DeviceListsState> {
  DeviceListsBloc() : super(DeviceListsInitial([])) {
    on<DeviceListsLoadEvent>((event, emit) {
      emit(DeviceListsInitial(event.list));
    });
  }
}
