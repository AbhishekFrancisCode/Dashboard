import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              if (state is StartInitial) {
                return Column(children: const <Widget>[
                  Text('data'),
                ]);
              } else if (state is StartError) {
                return ShowErrorWidget(state.errorMessage, height: null,
                    onPressed: () {
                  context.read<StartBloc>().add(const OnLoadStart());
                });
              }
              return ProgressIndicatorWidget();
            },
          )),
    );
  }
}
