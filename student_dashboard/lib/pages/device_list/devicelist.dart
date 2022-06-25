import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/model/student.dart';
import 'package:student_dashboard/pages/device_list/bloc/device_lists_bloc.dart';
import 'package:student_dashboard/pages/device_list/devicelist_view.dart';

class DeviceList extends StatelessWidget {
  List<Devices> deviceList;
  DeviceList({
    Key? key,
    required this.deviceList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeviceListsBloc()..add(DeviceListsLoadEvent(deviceList)),
      child: BlocBuilder<DeviceListsBloc, DeviceListsState>(
          builder: (context, state) {
        if (state is DeviceListsInitial) {
          return const DeviceListView();
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
