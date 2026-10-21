import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tisser_test_3/screens/homescreen.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';
import 'package:tisser_test_3/widgets/login_painter.dart';
import 'package:tisser_test_3/widgets/pillButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Any image URL works here
  static const String _photo = 'https://picsum.photos/seed/guitarist/900/1600';

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.anton(
      fontSize: 36,
      height: 1.0,
      color: AppColors.darkBackgroundColor,
    );

    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Full-screen photo
          Image.network(
            _photo,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : Container(color: const Color(0xFF2A2B30)),
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF2A2B30)), // fallback
          ),

          // 2. White hand-drawn doodle on the photo  as we dont need this right now so removing this 
          // // Positioned(
          // //   right: 28,
          // //   top: MediaQuery.of(context).size.height * 0.30,
          // //   child: CustomPaint(
          // //     size: const Size(150, 150),
             
          // //   ),
          // ),

          //  Bottom blue card
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 18),
                decoration: BoxDecoration(
                  color: AppColors.skyBlueCardColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: titleStyle,
                        children: [
                          const TextSpan(text: 'EXPLORE '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: CustomPaint(
                              painter: CirclePainter(
                                  AppColors.darkBackgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                child: Text('500+', style: titleStyle),
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: '\nMASTERCLASSES AND\nGAIN NEW SKILLS'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Pillbutton(
                      text: 'GET STARTED',
                      backgroundColor: AppColors.darkBackgroundColor,
                      textColor: Colors.white,
                      height: 56,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          'LOG IN',
                          style: Typo.buttonText.copyWith(
                              color: AppColors.darkBackgroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

