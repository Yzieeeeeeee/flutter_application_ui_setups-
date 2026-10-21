import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../models/calendar_day.dart';

class CalendarStrip extends StatelessWidget {
  final List<CalendarDay> days;
  final int selectedIndex;
  final ValueChanged<int>? onDaySelected;

  const CalendarStrip({
    super.key,
    required this.days,
    this.selectedIndex = 3, // Wed default
    this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(days.length, (index) {
          final day = days[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onDaySelected?.call(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Day name (Sun, Mon, Tue, etc.)
                Text(
                  day.dayName,
                  style: TextStyle(
                    color: isSelected ? AppColors.textWhite : AppColors.textGrey,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                // Date bubble / Progress ring
                _buildDayIndicator(day, isSelected),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDayIndicator(CalendarDay day, bool isSelected) {
    const double circleSize = 42;

    if (day.hasProgressRing) {
      return SizedBox(
        width: circleSize,
        height: circleSize,
        child: CustomPaint(
          painter: _ArcRingPainter(
            progress: day.ringProgress,
            ringColor: AppColors.neonYellow,
            trackColor: Colors.white.withValues(alpha: 0.12),
            strokeWidth: 3,
          ),
          child: Center(
            child: Text(
              day.dateText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      );
    }

    if (day.isOutlineOnly) {
      return Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.14),
            width: 1.5,
          ),
        ),
      );
    }

    // Days with numbers (Sun 13, Mon 2, Tue 7) have an olive-green ring border as in the reference
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1B1822),
        border: Border.all(
          color: isSelected
              ? AppColors.neonYellow
              : AppColors.oliveRing.withValues(alpha: 0.85),
          width: 1.8,
        ),
      ),
      child: Center(
        child: Text(
          day.dateText,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textLight,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ArcRingPainter extends CustomPainter {
  final double progress;
  final Color ringColor;
  final Color trackColor;
  final double strokeWidth;

  _ArcRingPainter({
    required this.progress,
    required this.ringColor,
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, trackPaint);

    // Active progress arc
    final progressPaint = Paint()
      ..color = ringColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    // Start from -90 degrees (top)
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.ringColor != ringColor ||
        oldDelegate.trackColor != trackColor;
  }
}
