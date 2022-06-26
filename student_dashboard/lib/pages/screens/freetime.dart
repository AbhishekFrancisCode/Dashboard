import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:student_dashboard/pages/start/bloc/start_bloc.dart';
import 'package:student_dashboard/utils/utils.dart';

// ignore: must_be_immutable
class FreeTime extends StatelessWidget {
  const FreeTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartBloc, StartState>(
      builder: (context, state) {
        if (state is StartLoadedState) {
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
                                getColumn('Max', state.limitz, Colors.black),
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
                                percent: (state.usage / 3600) /
                                    (state.limitz / 3600),
                                barRadius: const Radius.circular(16),
                                progressColor: Colors.green,
                              ),
                            ),
                          ),
                          needSpsce(context),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            const Text('Select the time'),
                                            GridView.count(
                                              shrinkWrap: true,
                                              crossAxisCount: 5,
                                              crossAxisSpacing: 2.0,
                                              mainAxisSpacing: 2.0,
                                              children: List.generate(
                                                  timeSlots.length, (index) {
                                                String convertime =
                                                    timeSlots[index].toString();
                                                int mintohr =
                                                    int.parse(convertime) * 60;
                                                if (mintohr >= 3600) {
                                                  convertime =
                                                      getTimez(mintohr);
                                                  return InkWell(
                                                    child: Card(
                                                      color: Colors.pink[50],
                                                      child: Center(
                                                        child: Text(convertime
                                                            .toString()),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      context
                                                          .read<StartBloc>()
                                                          .add(OnTimePickEvent(
                                                              mintohr));
                                                    },
                                                  );
                                                } else {
                                                  return InkWell(
                                                    child: Card(
                                                      color: Colors.pink[50],
                                                      child: Center(
                                                        child: Text(
                                                            '${convertime.toString()}m'),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      context
                                                          .read<StartBloc>()
                                                          .add(OnTimePickEvent(
                                                              mintohr));
                                                    },
                                                  );
                                                }
                                              }),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
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
                              onPressed: () {
                                //context.read<FreeTimeBloc>().add(FreeTimeExtendEvent())
                              },
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
          ;
        } else {
          return const CircularProgressIndicator();
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
