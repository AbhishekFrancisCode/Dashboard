import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends CustomPainter {
  final List<double> categories;
  final double width;

  PieChart({
    required this.categories,
    required this.width,
  });

  final kColorsPicker = [
    const Color.fromARGB(255, 39, 12, 212),
    const Color.fromARGB(255, 245, 84, 4),
    const Color.fromRGBO(123, 201, 82, 1),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 2;

    double total = categories[3];
    double startRadian = -pi / 2;
    for (var i = 0; i < categories.length; i++) {
      final currentCategory = categories.elementAt(i);
      final sweepRadian = currentCategory / total * 2 * pi;
      paint.color = kColorsPicker.elementAt(i % categories.length);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
