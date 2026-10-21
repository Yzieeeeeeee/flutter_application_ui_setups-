import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oc_liquid_glass/oc_liquid_glass.dart';

import '../core/app_colors.dart';
import '../core/mock_data.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import '../widgets/course_filter_bar.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/featured_course_carousel.dart';
import '../widgets/glass_bottom_navigation.dart';
import '../widgets/glass_surface.dart';
import 'course_details_screen.dart';
import 'schedule_screen.dart';

/// The primary "My Courses Dashboard" reproducing the reference design.
class CourseDashboardScreen extends StatefulWidget {
  const CourseDashboardScreen({super.key});

  @override
  State<CourseDashboardScreen> createState() => _CourseDashboardScreenState();
}

class _CourseDashboardScreenState extends State<CourseDashboardScreen> {
  int _topTabIndex = 0; // 0: My Courses, 1: Progress
  CourseFilterType _selectedFilter = CourseFilterType.all;
  int _navIndex = 0; // 0: Home, 1: Messages, 2: Explore, 3: Settings, 4: Search
  int _currentCarouselIndex = 0;
  late List<Course> _displayedCourses;

  @override
  void initState() {
    super.initState();
    _displayedCourses = MockData.getCoursesForFilter(_selectedFilter);

    if (MockData.featuredCarouselCourses.length > 1) {
      _currentCarouselIndex = 1;
    }
  }

  void _onFilterChanged(CourseFilterType filter) {
    setState(() {
      _selectedFilter = filter;
      _displayedCourses = MockData.getCoursesForFilter(filter);
    });
  }

  void _navigateToCourseDetails(Course course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailsScreen(course: course),
      ),
    );
  }

  void _navigateToSchedule() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScheduleScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ==========================================
          // LAYER 1: Full-Screen Gradient & Ambient Glows
          // ==========================================
          _buildBackgroundLayers(),

          // ==========================================
          // LAYER 2: Main Scrollable Content
          // ==========================================
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // 1. Header (Profile, Notification Bell, Segmented Selector)
                  DashboardHeader(
                    selectedTabIndex: _topTabIndex,
                    onTabSelected: (index) {
                      setState(() => _topTabIndex = index);
                      if (index == 1) {
                        _navigateToSchedule();
                      }
                    },
                    onProfileTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Creator Profile'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    onNotificationTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Notifications (No unread messages)'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // 2. Featured Course Card with Side Cards (Carousel)
                  FeaturedCourseCarousel(
                    courses: MockData.featuredCarouselCourses,

                    onPageChanged: (index) {
                      setState(() {
                        _currentCarouselIndex = index;
                      });
                    },
                    onCourseTap: _navigateToCourseDetails,
                    onContinueTap: (course) => _navigateToSchedule(),
                  ),
                  const SizedBox(height: 24),

                  // 3. Dark Lower Courses Section
                  _buildDarkLowerSection(),

                  // Bottom padding for floating glass bottom navigation
                  const SizedBox(height: 110),
                ],
              ),
            ),
          ),

          // ==========================================
          // LAYER 3: Floating Liquid Glass Bottom Navigation
          // ==========================================
          Positioned(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).padding.bottom > 0
                ? MediaQuery.of(context).padding.bottom + 6
                : 22,
            child: GlassBottomNavigation(
              currentIndex: _navIndex,
              onItemSelected: (index) {
                setState(() => _navIndex = index);
                if (index == 1 || index == 2) {
                  _navigateToSchedule();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundLayers() {
    // get the back ground image

    final String currentBgImage = MockData.featuredCarouselCourses.isNotEmpty
        ? (MockData
                  .featuredCarouselCourses[_currentCarouselIndex]
                  .bannerImage ??
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=700&q=80')
        : 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=700&q=80';
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
            child: Image.network(
            currentBgImage,
            key: ValueKey<String>(currentBgImage),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            ),
          ),
          Container(
            color: AppColors.scaffoldBackground.withValues(alpha: 0.55),
          ),
        ],
      ),
    );
  }

  /// Dark lower section with rounded top corners, course filter bar, and horizontal course cards
  Widget _buildDarkLowerSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground.withValues(alpha: 0.65),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.08),
            width: 1.2,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 28,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 22, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Compact course filters (All Courses 12, Completed 7, etc.)
          CourseFilterBar(
            selectedFilter: _selectedFilter,
            onFilterSelected: _onFilterChanged,
          ),
          const SizedBox(height: 18),

          // Horizontally scrollable course list
          SizedBox(
            height: 175,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _displayedCourses.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final course = _displayedCourses[index];
                return CourseCard(
                  course: course,
                  onTap: () => _navigateToCourseDetails(course),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
