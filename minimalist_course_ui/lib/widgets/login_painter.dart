import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Color color;
  CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size s) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(s.width * 0.10, s.height * 0.15)
      ..cubicTo(s.width * 0.55, -s.height * 0.20, s.width * 1.10,
          s.height * 0.30, s.width * 0.95, s.height * 0.75)
      ..cubicTo(s.width * 0.80, s.height * 1.15, s.width * 0.10,
          s.height * 1.10, s.width * 0.00, s.height * 0.60)
      ..cubicTo(s.width * -0.05, s.height * 0.10, s.width * 0.50,
          s.height * -0.05, s.width * 0.85, s.height * 0.05);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}