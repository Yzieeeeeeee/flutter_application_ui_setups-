import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';

class StatsTile extends StatelessWidget {
  final String label;
  final String value;
  const StatsTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: const EdgeInsets.fromLTRB(10, 12, 8, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: Typo.pillBadge.copyWith(
                  fontSize: 10,
                  height: 1.15,
                  color: AppColors.darkBackgroundColor)),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(value,
                style: GoogleFonts.anton(
                    fontSize: 40, color: AppColors.darkBackgroundColor)),
          ),
        ],
      ),
    );
  }
}