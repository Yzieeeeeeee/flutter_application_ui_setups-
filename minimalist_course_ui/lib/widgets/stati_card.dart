import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/colors.dart';

class StatiCard extends StatelessWidget {
  final Widget child;
  const StatiCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}