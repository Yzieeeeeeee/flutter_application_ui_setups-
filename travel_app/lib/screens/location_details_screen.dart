import 'package:flutter/material.dart';

import '../models/destination_model.dart';
import '../themes/colors.dart';
import '../widgets/brazil_flag.dart';
import '../widgets/tour_card.dart';
import 'tour_schedule_screen.dart';

class LocationDetailsScreen extends StatefulWidget {
  final Destination destination;

  const LocationDetailsScreen({super.key, required this.destination});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  bool _isFavorite = false;
  bool _isExpanded = false;
  final Set<String> _tourFavorites = {};

  void _openTour(Tour tour) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TourScheduleScreen(tour: tour),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // 1. Hero Image Background at Top loaded via Image.network
          SizedBox(
            height: 330,
            width: double.infinity,
            child: Image.network(
              destination.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.fallbackBlue,
              ),
            ),
          ),

          // 2. Scrollable Content with White Sheet
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer so top part of the hero image shows
                const SizedBox(height: 240),

                // White Card Sheet
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 14,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // Sheet Drag Handle
                      Center(
                        child: Container(
                          width: 44,
                          height: 4.5,
                          decoration: BoxDecoration(
                            color: AppColors.handleGray,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Title and Rating Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left: City & Country
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination.name,
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      if (destination.country == 'Brazil') ...[
                                        const BrazilFlagIcon(size: 18),
                                        const SizedBox(width: 8),
                                      ],
                                      Text(
                                        destination.country,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textSubtle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Right: Rating Pill and Review Count
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.borderLight,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star_border_rounded,
                                        color: AppColors.dark,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        destination.rating.toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.dark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${destination.reviewCount} reviews',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Description Paragraph with "Read more" toggle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.description,
                              maxLines: _isExpanded ? 10 : 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: AppColors.textDescription,
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                setState(() => _isExpanded = !_isExpanded);
                              },
                              child: Text(
                                _isExpanded ? 'Read less' : 'Read more',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // "Upcoming tours" and "See all" Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Upcoming tours',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (destination.upcomingTours.isNotEmpty) {
                                   _openTour(destination.upcomingTours.first);
                                }
                              },
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textDark,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Horizontal List of Tours loaded via Image.network
                      SizedBox(
                        height: 255,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          itemCount: destination.upcomingTours.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          itemBuilder: (context, index) {
                            final tour = destination.upcomingTours[index];
                            return TourCard(
                              tour: tour,
                              isFavorite: _tourFavorites.contains(tour.id),
                              onFavoriteToggle: () {
                                setState(() {
                                  if (_tourFavorites.contains(tour.id)) {
                                    _tourFavorites.remove(tour.id);
                                  } else {
                                    _tourFavorites.add(tour.id);
                                  }
                                });
                              },
                              onTap: () => _openTour(tour),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 3. Pinned Top Buttons (Back & Favorite)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                    icon: Icons.chevron_left_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildCircleButton(
                    icon: _isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    iconColor: _isFavorite
                        ? AppColors.favoriteRed
                        : AppColors.dark,
                    onTap: () {
                      setState(() => _isFavorite = !_isFavorite);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = AppColors.dark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }
}
