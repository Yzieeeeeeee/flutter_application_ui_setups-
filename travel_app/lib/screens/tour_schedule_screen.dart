import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/tour_model.dart';
import '../themes/colors.dart';
import '../widgets/itinerary_day_card.dart';

class TourScheduleScreen extends StatefulWidget {
  final Tour tour;

  const TourScheduleScreen({super.key, required this.tour});

  @override
  State<TourScheduleScreen> createState() => _TourScheduleScreenState();
}

class _TourScheduleScreenState extends State<TourScheduleScreen> {
  int _selectedTab = 0;
  bool _isFavorite = false;
  final Set<int> _expandedDays = {1}; // Day 1 expanded by default

  final List<String> _tabs = [
    'Tour schedule',
    'Accomodation',
    'Booking details',
  ];

  void _toggleDay(int dayNumber) {
    setState(() {
      if (_expandedDays.contains(dayNumber)) {
        _expandedDays.remove(dayNumber);
      } else {
        _expandedDays.add(dayNumber);
      }
    });
  }

  void _showBookingSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.handleGray,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Book ${widget.tour.title}',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.tour.dates,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textSubtle,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price per person:',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    color: AppColors.textDark,
                  ),
                ),
                Text(
                  '\$${widget.tour.priceFrom}',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tour successfully booked!'),
                    ),
                  );
                },
                child: Text(
                  'Confirm Booking',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tour = widget.tour;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Header Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      _buildCircleButton(
                        icon: Icons.chevron_left_rounded,
                        onTap: () => Navigator.pop(context),
                      ),

                      // Title and Dates
                      Column(
                        children: [
                          Text(
                            tour.title,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            tour.dates,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),

                      // Favorite Button
                      _buildCircleButton(
                        icon: _isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        iconColor: _isFavorite
                            ? AppColors.favoriteRed
                            : AppColors.dark,
                        onTap: () => setState(() => _isFavorite = !_isFavorite),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Horizontal Tab Chips
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabs.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final isSelected = _selectedTab == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedTab = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.dark
                                : AppColors.chipInactive,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _tabs[index],
                            style: GoogleFonts.plusJakartaSans(
                              color: isSelected ? AppColors.white : AppColors.textTabInactive,
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Main Scrollable Schedule
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 110),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tour.adventureTitle,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // List of Days loaded via ItineraryDayCard with Image.network
                        ...tour.schedule.map(
                          (day) => ItineraryDayCard(
                            day: day,
                            isExpanded: _expandedDays.contains(day.dayNumber),
                            onToggle: () => _toggleDay(day.dayNumber),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating Bottom Button: "Book a tour"
          Positioned(
            bottom: 28,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black.withValues(alpha: 0.25),
                ),
                onPressed: _showBookingSheet,
                child: Text(
                  'Book a tour',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
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
          border: Border.all(color: AppColors.borderSubtle),
        ),
        child: Icon(icon, color: iconColor, size: 24),
      ),
    );
  }
}
