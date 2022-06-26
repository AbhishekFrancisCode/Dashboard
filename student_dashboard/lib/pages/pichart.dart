import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends CustomPainter {
  final List<double> categories;
  final double width;
  final double totald;

  PieChart({
    required this.categories,
    required this.width,
    required this.totald,
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

    double total = totald;
    double startRadian = -pi / 2;
    for (var i = 0; i < categories.length; i++) {
      final currentCategory = categories.elementAt(i);
      final sweepRadian = currentCategory / total * 3 * pi;
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





// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:student_dashboard/model/pichartdata.dart';

// class PieChart extends CustomPainter {
//   final List<PicData> pidata;
//   final double width;
//   final double totald;

//   PieChart({required this.pidata, required this.width, required this.totald});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2.0, size.height / 2.0);
//     final radius = size.width * 0.9;
//     final rect = Rect.fromCenter(center: center, height: radius, width: radius);
//     var startAngle = 0.0;
//     for (var i in pidata) {
//       final sweepAngle = (i.value / 10000) * 360.0 * pi / 180.0;
//       var paint = Paint()
//         ..style = PaintingStyle.fill
//         ..color = i.color;
//       canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
//       startAngle += sweepAngle;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
