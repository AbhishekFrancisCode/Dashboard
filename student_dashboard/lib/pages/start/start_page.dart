import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/device_list/bloc/device_lists_bloc.dart';
import 'package:student_dashboard/pages/device_list/devicelist.dart';
import 'package:student_dashboard/pages/free_time/bloc/free_time_bloc.dart';
import 'package:student_dashboard/pages/free_time/freetime.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/pages/screen_time/screentime.dart';
import 'package:student_dashboard/pages/start/bloc/start_bloc.dart';
import 'package:student_dashboard/widgets/progress_indicator_widget.dart';
import 'package:student_dashboard/widgets/show_error_widget.dart';

class MyStartPage extends StatelessWidget {
  const MyStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abhishek'),
      ),
      body: BlocProvider<StartBloc>(
          create: (context) => StartBloc()..add(const OnLoadStart()),
          child: BlocBuilder<StartBloc, StartState>(
            builder: (context, state) {
              if (state is StartLoadedState) {
                final screentimeDataExtract = state.student.data?.screenTime;
                final freentimeDataExtract = state.student.data?.freeTime;
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      BlocProvider(
                          create: (context) => ScreenTimeBloc(),
                          child: ScreenTime(
                            clasz: screentimeDataExtract!.clasz!,
                            study: screentimeDataExtract.study!,
                            free: screentimeDataExtract.free!,
                            total: screentimeDataExtract.total!,
                          )),
                      BlocProvider(
                          create: (context) => FreeTimeBloc(),
                          child: FreeTime(
                            usage: freentimeDataExtract!.usage!,
                            limit: freentimeDataExtract.limit!,
                          )),
                      BlocProvider(
                          create: (context) => DeviceListsBloc(),
                          child: DeviceList()),
                    ],
                  ),
                );
              } else if (state is StartError) {
                return ShowErrorWidget(state.errorMessage, height: null,
                    onPressed: () {
                  context.read<StartBloc>().add(const OnLoadStart());
                });
              }
              return const ProgressIndicatorWidget();
            },
          )),
    );
  }
}
