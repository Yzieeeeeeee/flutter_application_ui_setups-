import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class SegmentedCourseSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const SegmentedCourseSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.14),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPill(
            title: 'My Courses',
            index: 0,
            isSelected: selectedIndex == 0,
          ),
          _buildPill(
            title: 'Progress',
            index: 1,
            isSelected: selectedIndex == 1,
          ),
        ],
      ),
    );
  }

  Widget _buildPill({
    required String title,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.22)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: isSelected
              ? Border.all(
                  color: Colors.white.withValues(alpha: 0.24),
                  width: 1,
                )
              : Border.all(color: Colors.transparent, width: 1),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.textWhite : Colors.white.withValues(alpha: 0.65),
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}
