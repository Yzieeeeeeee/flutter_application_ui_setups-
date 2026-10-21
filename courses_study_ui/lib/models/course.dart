class Course {
  final String id;
  final String title;
  final String instructor;
  final String instructorAvatar;
  final String rating;
  final String duration;
  final int totalLessons;
  final String description;
  final double progress;
  final String stepInfo;
  final String badgeText;
  final String audienceCount;
  final String? bannerImage;
  final bool hasGradient;
  final bool isImageOnly;
  final bool isCompleted;
  final bool isSaved;
  final String category;

  const Course({
    required this.id,
    required this.title,
    this.instructor = '',
    this.instructorAvatar = '',
    this.rating = '4.7',
    this.duration = '',
    this.totalLessons = 0,
    this.description = '',
    this.progress = 0.0,
    this.stepInfo = '1 of 5',
    this.badgeText = 'Active',
    this.audienceCount = '+1K',
    this.bannerImage,
    this.hasGradient = false,
    this.isImageOnly = false,
    this.isCompleted = false,
    this.isSaved = false,
    this.category = 'All',
  });
}