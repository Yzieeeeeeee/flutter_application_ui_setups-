import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/itinerary_model.dart';
import '../themes/colors.dart';

class ItineraryDayCard extends StatelessWidget {
  final ItineraryDay day;
  final bool isExpanded;
  final VoidCallback onToggle;

  const ItineraryDayCard({
    super.key,
    required this.day,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.cardGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Day Header
          ListTile(
            contentPadding: const EdgeInsets.all(12),
            onTap: onToggle,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                width: 68,
                height: 54,
                child: Image.network(
                  day.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.fallbackAvatar,
                    child: const Icon(Icons.landscape, color: Colors.grey),
                  ),
                ),
              ),
            ),
            title: Text(
              'Day ${day.dayNumber}',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
            subtitle: Text(
              day.title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            trailing: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSubtle,
              size: 26,
            ),
          ),

          // Expanded Schedule Items
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: day.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.timeOfDay,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13,
                            color: AppColors.textMuted,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.description,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
