import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screens/devicelist.dart';
import 'package:student_dashboard/pages/screens/freetime.dart';
import 'package:student_dashboard/pages/screens/screentime.dart';
import 'package:student_dashboard/pages/start/bloc/start_bloc.dart';
import 'package:student_dashboard/widgets/progress_indicator_widget.dart';
import 'package:student_dashboard/widgets/show_error_widget.dart';

class MyStartPage extends StatelessWidget {
  const MyStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.circle,
                  color: Colors.pink[100],
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  'CoinedOne',
                  style: TextStyle(color: Colors.grey[850]),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: BlocProvider<StartBloc>(
          create: (context) => StartBloc()..add(const OnLoadStart()),
          child: BlocBuilder<StartBloc, StartState>(
            builder: (context, state) {
              if (state is StartLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    children: const <Widget>[
                      ScreenTime(),
                      FreeTime(),
                      DeviceList(),
                    ],
                  ),
                );
              } else if (state is StartError) {
                return ShowErrorWidget(state.errorMessage, height: null,
                    onPressed: () {
                  context.read<StartBloc>().add(const OnLoadStart());
                });
              }
              return const Center(child: ProgressIndicatorWidget());
            },
          )),
    );
  }
}
