import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/pages/screen_time/screentime_view.dart';

// ignore: must_be_immutable
class ScreenTime extends StatelessWidget {
  int clasz;
  int study;
  int free;
  int total;
  ScreenTime({
    Key? key,
    required this.clasz,
    required this.study,
    required this.free,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScreenTimeBloc()
        ..add(ScreenTimeLoadEvent(
          clasz,
          study,
          free,
          total,
        )),
      child: BlocBuilder<ScreenTimeBloc, ScreenTimeState>(
        builder: (context, state) {
          if (state is ScreenTimeIntial) {
            return const ScreeningTimeView();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
