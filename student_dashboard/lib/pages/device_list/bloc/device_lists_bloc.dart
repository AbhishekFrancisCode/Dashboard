import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'device_lists_event.dart';
part 'device_lists_state.dart';

class DeviceListsBloc extends Bloc<DeviceListsEvent, DeviceListsState> {
  DeviceListsBloc() : super(DeviceListsInitial()) {
    on<DeviceListsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
