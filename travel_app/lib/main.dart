import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';
import 'themes/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Edge-to-edge transparent system UI
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const TripGlideApp());
}

class TripGlideApp extends StatelessWidget {
  const TripGlideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TripGlide',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        useMaterial3: true,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.dark,
          primary: AppColors.dark,
          surface: AppColors.surface,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}