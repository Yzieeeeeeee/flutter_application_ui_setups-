import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final bool hasBadge;
  final Color? backgroundColor;

  const CircularIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 44,
    this.iconSize = 20,
    this.hasBadge = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(size / 2),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor ?? AppColors.glassWhiteLight,
                border: Border.all(color: AppColors.glassBorder, width: 1),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(icon, size: iconSize, color: AppColors.textWhite),
                  if (hasBadge)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: AppColors.magentaBright,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
