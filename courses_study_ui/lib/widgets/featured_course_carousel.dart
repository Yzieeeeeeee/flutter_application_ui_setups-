import 'dart:async';

import 'package:flutter/material.dart';
import '../models/course.dart';
import 'featured_course_card.dart';

class FeaturedCourseCarousel extends StatefulWidget {
  final List<Course> courses;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<Course>? onCourseTap;
  final ValueChanged<Course>? onContinueTap;

  const FeaturedCourseCarousel({
    super.key,
    required this.courses,
    this.onPageChanged,
    this.onCourseTap,
    this.onContinueTap,
  });

  @override
  State<FeaturedCourseCarousel> createState() => _FeaturedCourseCarouselState();
}

class _FeaturedCourseCarouselState extends State<FeaturedCourseCarousel> {
  late final PageController _pageController;
  int _currentPage = 1;
  Timer ? _timer;

  @override
  void initState() {
    super.initState();
    // Default to the middle course (index 1) so left and right side cards are both visible
    _currentPage = widget.courses.length > 1 ? 1 : 0;
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.85,
    );

    _startAutoScroll();
  }

  void _startAutoScroll() {
    if (widget.courses.length <= 1) return;

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;

        // Loop back to the beginning if we reach the end
        if (nextPage >= widget.courses.length) {
          nextPage = 0;
        }

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.courses.isEmpty) {
      return const SizedBox.shrink();
    }

    final currentCourse = widget.courses[_currentPage];
    return SizedBox(
      height: 336,
      child: PageView.builder(
        controller: _pageController,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.courses.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
          widget.onPageChanged?.call(index);

          _timer?.cancel();
          _startAutoScroll();

        },
        itemBuilder: (context, index) {
          final isCurrent = index == _currentPage;
          final course = widget.courses[index];

          return AnimatedScale(
            scale: isCurrent ? 1.0 : 0.94,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: FeaturedCourseCard(
                course: course,
                isDimmed: !isCurrent,   // diiming ?
                onTap: () => widget.onCourseTap?.call(course),
                onContinue: () => widget.onContinueTap?.call(course),
              ),
            ),
          );
        },
      ),
    );
  }
}
