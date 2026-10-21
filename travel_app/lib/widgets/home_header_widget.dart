import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/colors.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting and subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Vanessa',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Welcome to TripGlide',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),

          // User Profile Avatar loaded via Image.network
          ClipOval(
            child: SizedBox(
              width: 48,
              height: 48,
              child: Image.network(
                'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/14/Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg/500px-Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg?utm_source=en.wikipedia.org&utm_campaign=parser&utm_content=thumbnail',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.fallbackAvatar,
                  child: const Icon(Icons.person, color: AppColors.fallbackIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
