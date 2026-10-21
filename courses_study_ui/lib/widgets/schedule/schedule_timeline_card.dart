import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../models/schedule_item.dart';

class ScheduleTimelineCard extends StatelessWidget {
  final ScheduleItem item;
  final VoidCallback? onTap;

  const ScheduleTimelineCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isHighlight = item.isHighlight;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: isHighlight
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFB84586),
                    Color(0xFF882B65),
                    Color(0xFF4C1841),
                    Color(0xFF261026),
                  ],
                  stops: [0.0, 0.38, 0.72, 1.0],
                )
              : null,
          color: isHighlight ? null : const Color(0xFF1B1724).withValues(alpha: 0.82),
          border: Border.all(
            color: isHighlight
                ? Colors.white.withValues(alpha: 0.22)
                : Colors.white.withValues(alpha: 0.08),
            width: 1,
          ),
          boxShadow: isHighlight
              ? [
                  BoxShadow(
                    color: const Color(0xFFB84586).withValues(alpha: 0.35),
                    blurRadius: 26,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          children: [
            // Top Row: Icon + Title & Subtitle + Progress status
            Row(
              children: [
                // Icon circle
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isHighlight
                        ? Colors.white
                        : Colors.black.withValues(alpha: 0.35),
                    border: Border.all(
                      color: isHighlight
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.10),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    item.icon,
                    size: 20,
                    color: isHighlight ? const Color(0xFF6B1D50) : Colors.white70,
                  ),
                ),
                const SizedBox(width: 14),

                // Title and duration
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.duration,
                        style: TextStyle(
                          color: isHighlight
                              ? const Color(0xFFF3D2E5)
                              : AppColors.textGrey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Trailing progress badge: ✓ 67%
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 16,
                      color: isHighlight
                          ? Colors.white.withValues(alpha: 0.9)
                          : AppColors.textGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${item.progressPercent}%',
                      style: TextStyle(
                        color: isHighlight
                            ? Colors.white.withValues(alpha: 0.9)
                            : AppColors.textGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Bottom Row: Time pill (11:30 AM) + "4 lesson >"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Time pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: isHighlight ? 0.35 : 0.45),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    item.time,
                    style: TextStyle(
                      color: isHighlight ? Colors.white : AppColors.textGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Lesson count with chevron
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.lessonCountText,
                      style: TextStyle(
                        color: isHighlight
                            ? const Color(0xFFF3D2E5)
                            : AppColors.textGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 18,
                      color: isHighlight
                          ? const Color(0xFFF3D2E5)
                          : AppColors.textGrey,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
