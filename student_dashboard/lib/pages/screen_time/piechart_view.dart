import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/pages/screen_time/pichart.dart';
import 'package:student_dashboard/utils/utils.dart';

class PieChartView<T> extends StatelessWidget {
  const PieChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenTimeBloc, ScreenTimeState>(
        builder: (context, state) {
      if (state is ScreenTimeIntial) {
        return Flexible(
          flex: 3,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 70,
                      child: const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      // height: constraints.maxWidth * 0.4,
                      child: Text(
                        getTime(state.total),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      //width: constraints.maxWidth * 0.6,
                      child: CustomPaint(
                          size: Size.zero,
                          foregroundPainter: PieChart(
                            categories: getList(state.props),
                            width: constraints.maxWidth * 0.15,
                          ),
                          child: const Center()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
