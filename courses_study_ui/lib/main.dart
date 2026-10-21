 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oc_liquid_glass/oc_liquid_glass.dart';
import 'core/app_theme.dart';
import 'screens/course_dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // precache liquid glass shader if platform support it
  if (!kIsWeb) {
    OCLiquidGlassGroup.precacheShader().catchError((e) {
      debugPrint('OCLiquidGlass shader precache skipped/unavailable: $e');
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Learning Platform for tisser',
      theme: AppTheme.darkTheme,
      home: const CourseDashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}