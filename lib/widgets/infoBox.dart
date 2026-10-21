import 'package:flutter/material.dart';
import 'package:tisser_application_test/themes/colors.dart';

/// "Quantity routes 5 Routes" / "Total distance 34 Km"
class InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  const InfoBox(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: WeatherColors.softBox,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: WeatherColors.textDark),
              const SizedBox(width: 8),
              Flexible(
                child: Text(title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11, color: WeatherColors.textDark)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: value,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: ' $unit',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                ],
              ),
              style: const TextStyle(color: WeatherColors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}
