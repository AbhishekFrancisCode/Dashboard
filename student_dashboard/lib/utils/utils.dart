import 'package:flutter/material.dart';

class Utils {
  static Color getColorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return hexCode.isEmpty
        ? Colors.transparent
        : Color(int.parse(hexCode, radix: 16));
  }
}
