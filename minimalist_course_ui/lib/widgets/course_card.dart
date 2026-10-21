import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/widgets/pill_badge.dart';
import 'package:tisser_test_3/themes/typo.dart';  
class Coursecard extends StatelessWidget {
  final String text;
  final List<String> tags;
  final String duration;
  final Color backgroundColor;
  final Color textColor;
  final Color tagBackgroundColor;
  final VoidCallback? onTap;
  const Coursecard({super.key,
   required this.text,
    required this.tags,
     required this.duration,
      required this.backgroundColor, 
      required this.textColor, 
      this.onTap,this.tagBackgroundColor = const Color(0x1A000000,
      )});



  @override
  Widget build(BuildContext context) {
    // Material + Ink so the ripple shows on the coloured card
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(28),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 210,
          padding: const EdgeInsets.all(18), // text no longer touches edges
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 6,
                children: tags
                    .map((t) => PillBadge(
                          text: t,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          borderColor: textColor.withValues(alpha: 0.35),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 14),
              Text(text.toUpperCase(),
                  style: Typo.pillBadgeContent.copyWith(color: textColor)),
              const Spacer(), // pushes duration to the bottom-left
              Text(duration,
                  style: Typo.statBadge.copyWith(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
 