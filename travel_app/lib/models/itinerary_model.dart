class ItineraryDay {
  final int dayNumber;
  final String title;
  final String imageUrl;
  final List<ScheduleItem> items;

  const ItineraryDay({
    required this.dayNumber,
    required this.title,
    required this.imageUrl,
    required this.items,
  });
}

class ScheduleItem {
  final String timeOfDay;
  final String description;

  const ScheduleItem({
    required this.timeOfDay,
    required this.description,
  });
}
