import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class AppAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final Border? border;

  const AppAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 20,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final diameter = radius * 2;

    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: diameter,
          height: diameter,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: diameter,
              height: diameter,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.magentaMedium, AppColors.plumDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(
                Icons.person_rounded,
                size: radius,
                color: Colors.white70,
              ),
            );
          },
        ),
      ),
    );
  }
}
