import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/course.dart';
import 'avatar_stack.dart';

class FeaturedCourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback? onTap;
  final VoidCallback? onContinue;
  final double? width;
  final double height;
  final bool isDimmed;

  const FeaturedCourseCard({
    super.key,
    required this.course,
    this.onTap,
    this.onContinue,
    this.width,
    this.height = 330,
    this.isDimmed = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: isDimmed ? 0.6 : 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.white.withValues(alpha: isDimmed ? 0.08 : 0.18),
              width: 1.2,
            ),

            boxShadow: isDimmed
                ? []
                : [

                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 1. Soft atmospheric glowing orbs in top corners
                Positioned(
                  top: -60,
                  right: -40,
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFFBDE3).withValues(alpha: 0.3),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: -40,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF7B235D).withValues(alpha: 0.35),
                    ),
                  ),
                ),

                // 2. Course Artwork (creative portrait silhouette blending with pink-purple background)
                Positioned.fill(
                  child: Image.network(
                    course.bannerImage ??
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=700&q=80',
                    fit: BoxFit.cover,
                    color: const Color(0xFF2A0820).withValues(alpha: 0.52),
                    colorBlendMode: BlendMode.lighten,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white38),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFE5A5C2), Color(0xFF4C1844)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // 3. Subtle dark vignette gradient overlay to elevate text contrast
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.16),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.40),
                        Colors.black.withValues(alpha: 0.84),
                      ],
                      stops: const [0.0, 0.30, 0.65, 1.0],
                    ),
                  ),
                ),

                // 4. Foreground Content (Top & Bottom alignment)
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Row: Avatar Stack & "Active" Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AvatarStack(
                            countBadge: '+1K',
                            avatarRadius: 13,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              course.badgeText,
                              style: const TextStyle(
                                color: Color(0xFF131019),
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Bottom Content: Title, Stats Row, "1 of 5" & Continue
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Course Title
                          Text(
                            course.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Compact stats row: Clock "18h 9m" | Star "4.7" | Video "16"
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                size: 15,
                                color: Color(0xFFEDE8F5),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                course.duration,
                                style: const TextStyle(
                                  color: Color(0xFFEDE8F5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 14),
                              const Icon(
                                Icons.star_rounded,
                                size: 17,
                                color: AppColors.starGold,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                course.rating,
                                style: const TextStyle(
                                  color: Color(0xFFEDE8F5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 14),
                              const Icon(
                                Icons.desktop_windows_outlined,
                                size: 15,
                                color: Color(0xFFEDE8F5),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${course.totalLessons}',
                                style: const TextStyle(
                                  color: Color(0xFFEDE8F5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Bottom Row: "1 of 5" and "Continue >"
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                course.stepInfo,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.78),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: onContinue ?? onTap,
                                behavior: HitTestBehavior.opaque,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Continue',
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.95),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 18,
                                      color: Colors.white.withValues(alpha: 0.95),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
