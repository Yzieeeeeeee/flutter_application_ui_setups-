import 'itinerary_model.dart';

class Tour {
  final String id;
  final String title;
  final int days;
  final int priceFrom;
  final double rating;
  final int reviewCount;
  final String dates;
  final String adventureTitle;
  final String imageUrl;
  final List<ItineraryDay> schedule;

  const Tour({
    required this.id,
    required this.title,
    required this.days,
    required this.priceFrom,
    required this.rating,
    required this.reviewCount,
    required this.dates,
    required this.adventureTitle,
    required this.imageUrl,
    required this.schedule,
  });
}
