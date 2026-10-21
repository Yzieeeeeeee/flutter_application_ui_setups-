import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/typo.dart';

class Pillbutton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final VoidCallback? onPressed;

  const Pillbutton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.height = 56,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // was hard-coded to 55 before, so `height` was ignored
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(text.toUpperCase(),
            style: Typo.buttonText.copyWith(color: textColor)),
      ),
    );
  }
}