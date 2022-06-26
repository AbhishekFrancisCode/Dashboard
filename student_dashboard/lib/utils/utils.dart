import 'package:flutter/material.dart';
import 'package:student_dashboard/model/pichartdata.dart';

class Utils {
  static Color getColorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return hexCode.isEmpty
        ? Colors.transparent
        : Color(int.parse(hexCode, radix: 16));
  }
}

List<double> getList(List<Object> data) {
  List<double> pichartData = [];
  for (int i = 0; i < data.length - 4; i++) {
    String string = data[i].toString();
    double doublez = double.parse(string);
    pichartData.add(doublez);
  }
  return pichartData;
}

List<PicData> getListPi(List<Object> data) {
  final kColorsPicker = [
    Colors.red,
    Colors.green,
    Color.fromARGB(252, 4, 125, 246),
  ];
  List<PicData> pi = [];
  for (int i = 0; i < data.length - 4; i++) {
    String string = data[i].toString();
    double doublez = double.parse(string);
    pi.add(PicData(value: doublez, lable: string, color: kColorsPicker[i]));
  }
  return pi;
}

String getTime(int total) {
  final int sec = total;
  var components = <String>[];
  final duration = Duration(seconds: sec);
  var hours = duration.inHours % 24;
  if (hours != 0) {
    components.add('${hours}h ');
  }
  var minutes = duration.inMinutes % 60;
  if (minutes != 0) {
    components.add('${minutes}m');
  }
  return components.join();
}

String getTimez(int total) {
  final int sec = total;
  var components = <String>[];
  final duration = Duration(seconds: sec);
  var hours = duration.inHours % 24;
  if (hours != 0) {
    components.add('${hours} : ');
  }
  var minutes = duration.inMinutes % 60;
  if (minutes != 0) {
    components.add('${minutes}');
  }
  return components.join();
}

needSpsce(BuildContext context) {
  return SizedBox(
    height: 25,
    width: MediaQuery.of(context).size.width,
  );
}

final timeSlots = <int>[
  10,
  15,
  20,
  25,
  30,
  35,
  40,
  45,
  50,
  55,
  60,
  65,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  105,
  110,
  115,
  120
];
