import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    this.imageUrl =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80',
    this.radius = 19,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final diameter = radius * 2;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: diameter + 4,
        height: diameter + 4,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.22),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.network(
            imageUrl,
            width: diameter,
            height: diameter,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: diameter,
                height: diameter,
                color: AppColors.darkCard,
                child: const Center(
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.white70),
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: diameter,
                height: diameter,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFE898C1), Color(0xFF6B1D50)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: radius * 1.1,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
