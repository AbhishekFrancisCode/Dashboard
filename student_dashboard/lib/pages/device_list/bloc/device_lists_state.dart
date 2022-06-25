part of 'device_lists_bloc.dart';

abstract class DeviceListsState extends Equatable {
  const DeviceListsState();
  
  @override
  List<Object> get props => [];
}

class DeviceListsInitial extends DeviceListsState {}
