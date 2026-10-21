import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AvatarStack extends StatelessWidget {
  final List<String> avatarUrls;
  final String? countBadge;
  final double avatarRadius;

  const AvatarStack({
    super.key,
    this.avatarUrls = const [
      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80',
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
    ],
    this.countBadge = '+1K',
    this.avatarRadius = 13,
  });

  @override
  Widget build(BuildContext context) {
    final overlapSpacing = avatarRadius * 1.25;
    final totalWidth = (avatarRadius * 2) + ((avatarUrls.length - 1) * overlapSpacing);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.16),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: totalWidth,
            height: avatarRadius * 2,
            child: Stack(
              children: List.generate(avatarUrls.length, (index) {
                return Positioned(
                  left: index * overlapSpacing,
                  child: Container(
                    width: avatarRadius * 2,
                    height: avatarRadius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        avatarUrls[index],
                        width: avatarRadius * 2,
                        height: avatarRadius * 2,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.darkCard,
                          child: Icon(
                            Icons.person,
                            size: avatarRadius,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          if (countBadge != null && countBadge!.isNotEmpty) ...[
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(
                countBadge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
