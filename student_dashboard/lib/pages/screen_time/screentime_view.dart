// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/pages/screen_time/categories.dart';
import 'package:student_dashboard/pages/screen_time/piechart_view.dart';
import 'package:student_dashboard/utils/utils.dart';

class ScreeningTimeView<T> extends StatelessWidget {
  const ScreeningTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenTimeBloc, ScreenTimeState>(
        builder: (context, state) {
      if (state is ScreenTimeIntial) {
        return SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.43,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    needSpsce(context),
                    const Center(
                      child: Text('Dashboard',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    needSpsce(context),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const PieChartView(),
                          needSpsce(context),
                          const CategoriesRow(),
                          needSpsce(context),
                          const Divider(
                            thickness: 2.0,
                          )
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
        return const SizedBox();
      }
    });
  }
}
