part of 'device_lists_bloc.dart';

abstract class DeviceListsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeviceListsLoadEvent extends DeviceListsEvent {
  final List<Devices> list;
  DeviceListsLoadEvent(this.list);

  @override
  List<Object> get props => [list];
}
