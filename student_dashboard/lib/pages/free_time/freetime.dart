import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/free_time/bloc/free_time_bloc.dart';
import 'package:student_dashboard/pages/free_time/freetime_view.dart';

class FreeTime extends StatelessWidget {
  int usage;
  int limit;
  FreeTime({
    Key? key,
    required this.usage,
    required this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreeTimeBloc()
        ..add(FreeTimeLoadEvent(
          usage,
          limit,
        )),
      child: BlocBuilder<FreeTimeBloc, FreeTimeState>(
        builder: (context, state) {
          if (state is FreeTimeInitial) {
            return const FreeTimeView();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
