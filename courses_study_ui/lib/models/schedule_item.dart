import 'package:flutter/material.dart';

class ScheduleItem {
  final String id;
  final String title;
  final String duration;
  final String time;
  final int progressPercent;
  final String lessonCountText;
  final IconData icon;
  final bool isHighlight;
  final bool isLocked;

  const ScheduleItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.time,
    required this.progressPercent,
    required this.lessonCountText,
    required this.icon,
    this.isHighlight = false,
    this.isLocked = false,
  });
}
