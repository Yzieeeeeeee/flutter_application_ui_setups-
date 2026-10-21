import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/course.dart';
import 'avatar_stack.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const CourseCard({
    super.key,
    required this.course,
    this.onTap,
    this.width = 158,
    this.height = 175,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.10),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: course.isImageOnly ? _buildArtworkCard() : _buildContentCard(),
        ),
      ),
    );
  }

  /// Artwork dominated card (Left card in reference image)
  Widget _buildArtworkCard() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Warm floral gradient fallback
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF3C4AD),
                Color(0xFFE28C91),
                Color(0xFFAB4D74),
                Color(0xFF4A1838),
              ],
            ),
          ),
        ),

        // High quality fluid / botanical art
        Image.network(
          course.bannerImage ??
              'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?auto=format&fit=crop&w=400&q=80',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white30),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  /// Dark card with Avatar Stack & Multi-line typography (Right card in reference image)
  Widget _buildContentCard() {
    return Container(
      color: AppColors.darkCard,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Overlapping avatars near top with "+2K" badge
          AvatarStack(
            countBadge: course.audienceCount.isNotEmpty ? course.audienceCount : '+2K',
            avatarRadius: 12,
            avatarUrls: const [
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
              'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?auto=format&fit=crop&w=150&q=80',
            ],
          ),

          // Course Title (Multi-line clean white typography)
          Text(
            course.title,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 1.22,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}
