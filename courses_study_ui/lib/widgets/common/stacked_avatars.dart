import 'package:flutter/material.dart';
import 'app_avatar.dart';

class StackedAvatars extends StatelessWidget {
  final List<String> avatarUrls;
  final String countBadge;
  final double avatarRadius;

  const StackedAvatars({
    super.key,
    this.avatarUrls = const [
      'https://d3nfwcxd527z59.cloudfront.net/content/uploads/2022/09/30095438/Lionel-Messi-Barcelona-1.jpg',
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
    ],
    this.countBadge = '+1K',
    this.avatarRadius = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: avatarRadius * 2 + (avatarUrls.length - 1) * (avatarRadius * 1.2),
            height: avatarRadius * 2,
            child: Stack(
              children: List.generate(avatarUrls.length, (index) {
                return Positioned(
                  left: index * (avatarRadius * 1.2),
                  child: AppAvatar(
                    imageUrl: avatarUrls[index],
                    radius: avatarRadius,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              countBadge,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
