import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_dashboard/pages/start/bloc/start_bloc.dart';
import 'package:student_dashboard/utils/utils.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartBloc, StartState>(builder: (context, state) {
      if (state is StartLoadedState) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text('By Devices',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  needSpsce(context),
                  Flexible(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final String name = state.list[index].name.toString();
                        final int? usage = state.list[index].usage;
                        return ListTile(
                          horizontalTitleGap: 20,
                          leading: getIcon(name),
                          title: getColumn(name, usage!, Colors.green),
                        );
                      },
                      itemCount: state.list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  ),
                  needSpsce(context),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("See All Devices"),
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

  Widget getColumn(String s, int data, Color? color) {
    return Column(children: [
      Text(
        s,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
      Text(
        getTime(data),
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
    ]);
  }

  Icon getIcon(String name) {
    final toFind = name;
    if (toFind.contains('Laptop') ||
        toFind.contains('Pc') ||
        toFind.contains('Computer')) {
      return const Icon(
        Icons.laptop_mac_outlined,
        size: 60,
      );
    } else if (toFind.contains('Phone')) {
      return const Icon(
        Icons.phone_android,
        size: 60,
      );
    } else if (toFind.contains('Tablet')) {
      return const Icon(
        Icons.tablet_android_outlined,
        size: 60,
      );
    } else if (toFind.contains('TV') || toFind.contains('Television')) {
      return const Icon(
        Icons.tablet_android_outlined,
        size: 60,
      );
    } else {
      return const Icon(
        Icons.device_hub_outlined,
        size: 60,
      );
    }
  }
}
