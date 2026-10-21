import 'package:flutter/material.dart';
import '../core/app_colors.dart';

enum CourseFilterType {
  all,
  completed,
  incomplete,
  saved,
}

class CourseFilterItem {
  final CourseFilterType type;
  final String label;
  final int count;

  const CourseFilterItem({
    required this.type,
    required this.label,
    required this.count,
  });
}

class CourseFilterBar extends StatelessWidget {
  final CourseFilterType selectedFilter;
  final ValueChanged<CourseFilterType> onFilterSelected;

  const CourseFilterBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  static const List<CourseFilterItem> filters = [
    CourseFilterItem(type: CourseFilterType.all, label: 'All Courses', count: 12),
    CourseFilterItem(type: CourseFilterType.completed, label: 'Completed', count: 7),
    CourseFilterItem(type: CourseFilterType.incomplete, label: 'Incomplete', count: 3),
    CourseFilterItem(type: CourseFilterType.saved, label: 'Saved', count: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: filters.map((item) {
          final isSelected = item.type == selectedFilter;

          return GestureDetector(
            onTap: () => onFilterSelected(item.type),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: isSelected ? AppColors.textWhite : AppColors.textGrey,
                  fontFamily: 'Plus Jakarta Sans',
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        letterSpacing: -0.2,
                        color: isSelected ? Colors.white : const Color(0xFF7E788B),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Transform.translate(
                      offset: const Offset(0, -2),
                      child: Text(
                        '${item.count}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : const Color(0xFF7E788B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
