import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/screen_time/bloc/screen_time_bloc.dart';
import 'package:student_dashboard/utils/utils.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenTimeBloc, ScreenTimeState>(
        builder: (context, state) {
      if (state is ScreenTimeIntial) {
        return Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              getColumn('class', state.clasz, Colors.blue[800]),
              getColumn('Study', state.study, Colors.orange[800]),
              getColumn('Free-time', state.free, Colors.green[800]),
            ],
          ),
        );
      } else {
        return const SizedBox();
      }
    });
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
