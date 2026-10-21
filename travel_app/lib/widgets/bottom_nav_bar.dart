import 'package:flutter/material.dart';

import '../themes/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 28,
      left: 28,
      right: 28,
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home_outlined),
            _buildNavItem(1, Icons.confirmation_number_outlined),
            _buildNavItem(2, Icons.favorite_border_rounded),
            _buildNavItem(3, Icons.grid_view_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? AppColors.dark : Colors.white54,
          size: 24,
        ),
      ),
    );
  }
}
