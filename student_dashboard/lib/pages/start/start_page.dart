import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/pages/screen_time/screentime_view.dart';
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
                final data = state.student.data?.screenTime;
                return Column(
                  children: <Widget>[
                    BlocProvider(
                        create: (context) => ScreenTimeBloc(),
                        child: ScreeningTimeView(
                          clasz: data!.clasz!,
                          study: data.study!,
                          free: data.free!,
                          total: data.total!,
                        )),
                  ],
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
