import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:student_dashboard/pages/free_time/bloc/free_time_bloc.dart';
import 'package:student_dashboard/utils/utils.dart';

class FreeTimeView extends StatelessWidget {
  const FreeTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreeTimeBloc, FreeTimeState>(
      builder: (context, state) {
        if (state is FreeTimeInitial) {
          return SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: Text('Free time Usage',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    needSpsce(context),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getColumn('Used', state.usage, Colors.green),
                                const SizedBox(
                                  width: 50,
                                ),
                                getColumn('Max', state.limit, Colors.black),
                              ],
                            ),
                          ),
                          needSpsce(context),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 50,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2500,
                                percent:
                                    (state.usage / 3600) / (state.limit / 3600),
                                barRadius: const Radius.circular(16),
                                progressColor: Colors.green,
                              ),
                            ),
                          ),
                          needSpsce(context),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          color: Colors.blue,
                                          width: 1.0,
                                          style: BorderStyle.solid))),
                              child: const Text("Extend Free Time"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          color: Colors.blue,
                                          width: 1.0,
                                          style: BorderStyle.solid))),
                              child: const Text("Change Time Ristriction"),
                            ),
                          ),
                          const Divider(
                            thickness: 2.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget getColumn(String s, int data, Color? color) {
    return Column(children: [
      Text(s,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          )),
      Text(getTime(data),
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    ]);
  }
}
