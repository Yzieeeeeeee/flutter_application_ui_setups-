import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 56,
        padding: const EdgeInsets.only(left: 18, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Search Icon
            const Icon(
              Icons.search_rounded,
              color: AppColors.dark,
              size: 22,
            ),
            const SizedBox(width: 12),

            // Search Text
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: AppColors.textPlaceholder,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            // Merged Circul /Settings Button
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: AppColors.dark,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.tune_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}