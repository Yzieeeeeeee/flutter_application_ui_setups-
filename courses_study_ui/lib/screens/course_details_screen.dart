import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/mock_data.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../widgets/course_details/instructor_tile.dart';
import '../widgets/course_details/lesson_card.dart';
import '../widgets/course_details/video_player_widget.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course? course;
  final List<Lesson>? lessons;

  const CourseDetailsScreen({
    super.key,
    this.course,
    this.lessons,
  });

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late Course _course;
  late List<Lesson> _lessons;

  @override
  void initState() {
    super.initState();
    _course = widget.course ?? MockData.creativeSprintCourse;
    _lessons = widget.lessons ?? MockData.creativeSprintLessons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Video Player with top and bottom glass controls
            VideoPlayerWidget(
              onBack: () => Navigator.maybePop(context),
              onBookmark: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Course bookmarked!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            // 2. Course Information Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    _course.title,
                    style: const TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    _course.description,
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Instructor Profile Row
                  InstructorTile(
                    name: _course.instructor,
                    avatarUrl: _course.instructorAvatar,
                    rating: _course.rating,
                  ),
                  const SizedBox(height: 28),

                  // Lessons Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Lessons',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${_course.totalLessons}',
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Lessons List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: _lessons.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final lesson = _lessons[index];
                      return LessonCard(
                        lesson: lesson,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Starting ${lesson.title}...'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}