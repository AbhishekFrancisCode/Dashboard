import 'package:flutter/material.dart';

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
  for (var element in data) {
    String string = element.toString();
    double integer = double.parse(string);
    pichartData.add(integer);
  }
  return pichartData;
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

needSpsce(BuildContext context) {
  return SizedBox(
    height: 25,
    width: MediaQuery.of(context).size.width,
  );
}
