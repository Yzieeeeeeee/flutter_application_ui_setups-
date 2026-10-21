import 'package:flutter/material.dart';
import '../models/calendar_day.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../models/schedule_item.dart';
import '../widgets/course_filter_bar.dart';

class MockData {
  MockData._();

  static const Course creativeSprintCourse = Course(
    id: 'c1',
    title: 'Creative Sprint',
    instructor: 'Daniel Reed',
    instructorAvatar:
        'https://in.images.search.yahoo.com/search/images;_ylt=A2RTS1S7985qLgMANyO9HAx.;_ylu=Y29sbwNhcC1zb3V0aGVhc3QtMQRwb3MDNAR2dGlkAwRzZWMDc3I-?fr=mcafee&p=lilnasx&imgurl=https%3A%2F%2Fnationaltoday.com%2Fwp-content%2Fuploads%2F2022%2F10%2F456841014-min-1200x834.jpg',
    rating: '4.9',
    duration: '28:00',
    totalLessons: 14,
    description:
        'A fast-paced course focused on generating, shaping, and refining ideas for creative projects, products, and content.',
    progress: 0.44,
    stepInfo: '2 of 6',
    badgeText: 'Active',
    audienceCount: '+800',
    isSaved: true,
  );

  static const Course aiForCreatorsCourse = Course(
    id: 'c2',
    title: 'AI for Creators',
    instructor: 'Lil nas X',
    instructorAvatar:
        'https://in.images.search.yahoo.com/search/images;_ylt=A2RTS1S7985qLgMANyO9HAx.;_ylu=Y29sbwNhcC1zb3V0aGVhc3QtMQRwb3MDNAR2dGlkAwRzZWMDc3I-?fr=mcafee&p=lilnasx&imgurl=https%3A%2F%2Fnationaltoday.com%2Fwp-content%2Fuploads%2F2022%2F10%2F456841014-min-1200x834.jpg',
    rating: '4.7',
    duration: '18h 9m',
    totalLessons: 16,
    description: 'Master AI generative tools and workflows to boost your creative production.',
    stepInfo: '1 of 5',
    badgeText: 'Active',
    audienceCount: '+1K',
    hasGradient: true,
    bannerImage:
        'https://in.images.search.yahoo.com/search/images;_ylt=A2RTS1S7985qLgMANyO9HAx.;_ylu=Y29sbwNhcC1zb3V0aGVhc3QtMQRwb3MDNAR2dGlkAwRzZWMDc3I-?fr=mcafee&p=lilnasx&imgurl=https%3A%2F%2Fnationaltoday.com%2Fwp-content%2Fuploads%2F2022%2F10%2F456841014-min-1200x834.jpg',
  );

  static const Course visualStorytellingCourse = Course(
    id: 'c3',
    title: 'Visual Storytelling',
    instructor: 'Elena Vance',
    instructorAvatar:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=300&q=80',
    rating: '4.8',
    duration: '12h 30m',
    totalLessons: 10,
    description: 'Cinematic visual composition and art direction principles for creators.',
    stepInfo: '1 of 4',
    badgeText: 'New',
    audienceCount: '+1.5K',
    bannerImage:
        'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=700&q=80',
  );

  /// Featured carousel courses (Left side card, Center active card, Right side card)
  static const List<Course> featuredCarouselCourses = [
    creativeSprintCourse,
    aiForCreatorsCourse,
    visualStorytellingCourse,
  ];

  /// Lower section course cards
  static const Course sketchToVisionArtwork = Course(
    id: 'b1',
    title: 'Floral Resonance',
    isImageOnly: true,
    bannerImage:
        'https://d3nfwcxd527z59.cloudfront.net/content/uploads/2022/09/30095438/Lionel-Messi-Barcelona-1.jpg',
  );

  static const Course sketchToVisionContent = Course(
    id: 'b2',
    title: 'From\nSketch to\nVision',
    audienceCount: '+2K',
    duration: '6h 15m',
    rating: '4.9',
    totalLessons: 8,
    isSaved: true,
  );

  static const Course creativeDirectionsCard = Course(
    id: 'b3',
    title: 'Creative\nDirections',
    audienceCount: '+3K',
    duration: '8h 40m',
    rating: '4.8',
    totalLessons: 12,
    isCompleted: true,
  );

  static const Course generativeArtCard = Course(
    id: 'b4',
    title: 'Generative\nArt Lab',
    audienceCount: '+1.2K',
    duration: '4h 20m',
    rating: '4.6',
    totalLessons: 5,
    progress: 0.6,
  );

  static List<Course> getCoursesForFilter(CourseFilterType filter) {
    switch (filter) {
      case CourseFilterType.completed:
        return const [
          creativeDirectionsCard,
          sketchToVisionArtwork,
        ];
      case CourseFilterType.incomplete:
        return const [
          generativeArtCard,
          sketchToVisionContent,
        ];
      case CourseFilterType.saved:
        return const [
          sketchToVisionContent,
          creativeSprintCourse,
        ];
      case CourseFilterType.all:
        return const [
          sketchToVisionArtwork,
          sketchToVisionContent,
          generativeArtCard,
          creativeDirectionsCard,
        ];
    }
  }

  static const List<Lesson> creativeSprintLessons = [
    Lesson(
      id: 'l1',
      title: 'Idea Flow',
      duration: '28 min',
      icon: Icons.lightbulb_outline_rounded,
      subtitle: '1 lesson',
      isCompleted: true,
    ),
    Lesson(
      id: 'l2',
      title: 'Concept Building',
      duration: '47 min',
      icon: Icons.graphic_eq_rounded,
      subtitle: '2 lesson',
      isCompleted: false,
    ),
    Lesson(
      id: 'l3',
      title: 'Visual Prototyping',
      duration: '34 min',
      icon: Icons.auto_awesome_outlined,
      subtitle: '3 lesson',
      isCompleted: false,
    ),
  ];

  static const List<CalendarDay> weekDays = [
    CalendarDay(dayName: 'Sun', dateText: '13'),
    CalendarDay(dayName: 'Mon', dateText: '2'),
    CalendarDay(dayName: 'Tue', dateText: '7'),
    CalendarDay(
      dayName: 'Wed',
      dateText: '3/6',
      isSelected: true,
      hasProgressRing: true,
      ringProgress: 0.65,
    ),
    CalendarDay(dayName: 'Thu', dateText: '', isOutlineOnly: true),
    CalendarDay(dayName: 'Fri', dateText: '', isOutlineOnly: true),
    CalendarDay(dayName: 'Sat', dateText: '', isOutlineOnly: true),
  ];

  static const List<ScheduleItem> scheduleItems = [
    ScheduleItem(
      id: 's1',
      title: 'AI for Creators',
      duration: '42 min',
      time: '11:30 AM',
      progressPercent: 67,
      lessonCountText: '4 lesson',
      icon: Icons.rocket_launch_rounded,
      isHighlight: true,
    ),
    ScheduleItem(
      id: 's2',
      title: 'Creative Directions',
      duration: '56 min',
      time: '02:30 PM',
      progressPercent: 42,
      lessonCountText: '8 lesson',
      icon: Icons.lock_outline_rounded,
      isLocked: true,
    ),
    ScheduleItem(
      id: 's3',
      title: 'Refining the Best Ideas',
      duration: '18 min',
      time: '05:30 PM',
      progressPercent: 17,
      lessonCountText: '2 lesson',
      icon: Icons.lock_outline_rounded,
      isLocked: true,
    ),
  ];
}
