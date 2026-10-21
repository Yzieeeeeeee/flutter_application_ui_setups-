import 'dart:ui';

import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final List<int> levels;
  final double Function(double) yOf;
  final double left;
  final Color color;

  GridPainter({
    required this.levels,
    required this.yOf,
    required this.left,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (final l in levels) {
      final y = yOf(l.toDouble());
      double x = left;
      while (x < size.width) {
        canvas.drawLine(Offset(x, y), Offset(x + 4, y), paint);
        x += 8;
      }
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter old) => false;
}