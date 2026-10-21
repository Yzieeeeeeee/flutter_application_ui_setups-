import 'package:flutter/material.dart';

class Lesson {
  final String id;
  final String title;
  final String duration;
  final IconData icon;
  final String subtitle;
  final bool isCompleted;

  const Lesson({
    this.id = '',
    required this.title,
    required this.duration,
    required this.icon,
    required this.subtitle,
    this.isCompleted = false,
  });
}
