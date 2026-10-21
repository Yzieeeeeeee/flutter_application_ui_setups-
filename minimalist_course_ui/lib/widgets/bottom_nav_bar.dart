import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({
    super.key,
    required this.activeIndex,
    required this.onTabSelected,
  });

  static const _icons = [
    Icons.home_filled,
    Icons.search,
    Icons.favorite_border,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor, // light bar like the design
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_icons.length, (i) {
              final selected = i == activeIndex;
              return IconButton(
                onPressed: () => onTabSelected(i),
                icon: Icon(
                  _icons[i],
                  size: 26,
                  color: selected
                      ? AppColors.darkBackgroundColor
                      : AppColors.darkBackgroundColor.withValues(alpha: 0.75),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}