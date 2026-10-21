import 'package:flutter/material.dart';
import 'course_dashboard_screen.dart';

export 'course_dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CourseDashboardScreen();
  }
}
