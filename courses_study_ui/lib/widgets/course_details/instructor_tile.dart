import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../common/app_avatar.dart';

class InstructorTile extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String rating;

  const InstructorTile({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppAvatar(
              imageUrl: avatarUrl,
              radius: 20,
              border: Border.all(
                color: AppColors.magentaBright.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'By',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rating,
              style: const TextStyle(
                color: AppColors.textWhite,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.star_rounded,
              color: AppColors.starGold,
              size: 20,
            ),
          ],
        ),
      ],
    );
  }
}
