import 'tour_model.dart';

export 'itinerary_model.dart';
export 'tour_model.dart';

class Destination {
  final String id;
  final String country;
  final String name;
  final String region;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String description;
  final List<Tour> upcomingTours;

  const Destination({
    required this.id,
    required this.country,
    required this.name,
    required this.region,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
    this.upcomingTours = const [],
  });
}