import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';

class CourseStatCard extends StatelessWidget {
  final String label;
  final String value;
  const CourseStatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: Typo.pillBadge
                  .copyWith(color: AppColors.darkBackgroundColor)),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: GoogleFonts.anton(
                fontSize: 26,
                color: AppColors.darkBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}