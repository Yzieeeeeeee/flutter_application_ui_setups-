class CalendarDay {
  final String dayName;
  final String dateText;
  final bool isSelected;
  final bool hasProgressRing;
  final double ringProgress; // 0.0 to 1.0
  final bool isOutlineOnly;

  const CalendarDay({
    required this.dayName,
    required this.dateText,
    this.isSelected = false,
    this.hasProgressRing = false,
    this.ringProgress = 0.0,
    this.isOutlineOnly = false,
  });
}
