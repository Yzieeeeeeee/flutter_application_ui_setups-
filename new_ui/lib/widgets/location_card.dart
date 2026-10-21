import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';
import 'package:tisser_application_test/models/location.dart';
import 'package:tisser_application_test/themes/colors.dart';
import 'package:tisser_application_test/widgets/infoBox.dart';

class LocationCard extends StatelessWidget {
  final LocationModel data;
  final VoidCallback? onTap;
  const LocationCard({super.key, required this.data, this.onTap});

  Widget _stat(IconData icon, String value, String label) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 17, color: WeatherColors.textDark),
            const SizedBox(width: 6),
            Text(value,
                style:  AppTypography.location.copyWith(
                    color: WeatherColors.textDark)),
          ],
        ),
        const SizedBox(height: 4),
        Text(label,
            style:  AppTypography.subBody.copyWith(
                fontSize: 12, color: WeatherColors.textGrey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: WeatherColors.card,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name,
                        style:  AppTypography.heading.copyWith(
                            color: WeatherColors.textDark)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: WeatherColors.textGrey),
                        const SizedBox(width: 4),
                        Text(data.place,
                            style: const TextStyle(
                                fontSize: 12,
                                color: WeatherColors.textGrey)),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                      color: WeatherColors.softBox, shape: BoxShape.circle),
                  child: const Icon(Icons.north_east,
                      size: 18, color: WeatherColors.textDark),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _stat(Icons.thermostat, data.temperature, 'Temperature'),
              _stat(Icons.air, data.wind, 'Wind'),
              _stat(Icons.water_drop_outlined, data.humidity, 'Humidity'),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: InfoBox(
                    icon: Icons.route,
                    title: 'Quantity routes',
                    value: data.routes,
                    unit: 'Routes'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InfoBox(
                    icon: Icons.swap_calls,
                    title: 'Total distance',
                    value: data.distance,
                    unit: 'Km'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
