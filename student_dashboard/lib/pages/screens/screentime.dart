import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/pichart.dart';
import 'package:student_dashboard/pages/start/bloc/start_bloc.dart';
import 'package:student_dashboard/utils/utils.dart';

// ignore: must_be_immutable
class ScreenTime extends StatelessWidget {
  const ScreenTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartBloc, StartState>(
      builder: (context, state) {
        if (state is StartLoadedState) {
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
                            Flexible(
                              flex: 3,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        height: 70,
                                        child: const Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        getTime(state.total),
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: constraints.maxWidth * 0.6,
                                        child: CustomPaint(
                                            size: Size.zero,
                                            foregroundPainter: PieChart(
                                              categories: getList(state.props),
                                              width:
                                                  constraints.maxWidth * 0.10,
                                              totald: state.total.toDouble(),
                                            ),
                                            child: const Center()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            needSpsce(context),
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  getColumn(
                                      'Class', state.clasz, Colors.blue[800]),
                                  getColumn(
                                      'Study', state.study, Colors.orange[800]),
                                  getColumn('Free-time', state.free,
                                      Colors.green[800]),
                                ],
                              ),
                            ),
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
          ;
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget getColumn(String s, int data, Color? color) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Text(s,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(getTime(data))
      ],
    );
  }
}
