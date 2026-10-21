import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../common/circular_icon_button.dart';

class ScheduleTopBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onPreviousRange;
  final VoidCallback? onNextRange;
  final String dateRangeText;

  const ScheduleTopBar({
    super.key,
    this.onBack,
    this.onNotificationTap,
    this.onPreviousRange,
    this.onNextRange,
    this.dateRangeText = 'January 4-10',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Circular Back Button
          CircularIconButton(
            icon: Icons.arrow_back_rounded,
            onTap: onBack ?? () => Navigator.maybePop(context),
          ),

          // Date Range with chevrons: < January 4-10 >
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onPreviousRange,
                child: const Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.textWhite,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                dateRangeText,
                style: const TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onNextRange,
                child: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textWhite,
                  size: 24,
                ),
              ),
            ],
          ),

          // Circular Notification Bell
          CircularIconButton(
            icon: Icons.notifications_none_rounded,
            onTap: onNotificationTap,
          ),
        ],
      ),
    );
  }
}
