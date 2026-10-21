import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/typo.dart';
 
class PillBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
 
  const PillBadge({
    super.key,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.borderColor,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: borderColor == null
            ? null
            : Border.all(color: borderColor!, width: 1),
      ),
      child: Text(text.toUpperCase(),
          style: Typo.pillBadge.copyWith(color: textColor)),
    );
  }
}
 
