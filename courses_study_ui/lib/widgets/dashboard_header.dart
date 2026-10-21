import 'package:flutter/material.dart';
import 'common/circular_icon_button.dart';
import 'profile_avatar.dart';
import 'segmented_course_selector.dart';

class DashboardHeader extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;

  const DashboardHeader({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
    this.onProfileTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // Top Row: Profile photo & Notification button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileAvatar(
                onTap: onProfileTap,
              ),
              CircularIconButton(
                icon: Icons.notifications_none_rounded,
                onTap: onNotificationTap,
                size: 42,
                iconSize: 20,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Centered Segmented Control: "My Courses" | "Progress"
          Center(
            child: SegmentedCourseSelector(
              selectedIndex: selectedTabIndex,
              onTabSelected: onTabSelected,
            ),
          ),
        ],
      ),
    );
  }
}
