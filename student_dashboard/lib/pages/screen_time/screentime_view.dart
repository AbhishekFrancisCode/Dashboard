// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/pages/screen_time/categories.dart';
import 'package:student_dashboard/pages/screen_time/piechart_view.dart';

class ScreeningTimeView<T> extends StatelessWidget {
  int clasz;
  int study;
  int free;
  int total;
  ScreeningTimeView({
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
          return SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text('Dashboaard',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: Column(
                          children: const <Widget>[
                            PieChartView(),
                            CategoriesRow(),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
