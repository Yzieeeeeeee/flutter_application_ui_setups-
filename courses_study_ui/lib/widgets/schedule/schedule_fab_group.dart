import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class ScheduleFabGroup extends StatelessWidget {
  final VoidCallback? onEditTap;
  final VoidCallback? onAddTap;

  const ScheduleFabGroup({
    super.key,
    this.onEditTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFabButton(
          icon: Icons.edit_outlined,
          onTap: onEditTap,
        ),
        const SizedBox(width: 14),
        _buildFabButton(
          icon: Icons.add_rounded,
          onTap: onAddTap,
        ),
      ],
    );
  }

  Widget _buildFabButton({
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(28),
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1D1828).withValues(alpha: 0.85),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.16),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: AppColors.textWhite,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
