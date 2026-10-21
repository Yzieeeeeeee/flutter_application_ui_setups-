import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';

/// Used in the header row: Wind / Humidity / Visibility
class WeatherStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const WeatherStat(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 15, color: Colors.white),
            const SizedBox(width: 6),
            Text(label,
                style: AppTypography.subBody.copyWith (color: Colors.white)),
          ],
        ),
        const SizedBox(height: 6),
        Text(value,
            style: AppTypography.body.copyWith(
                color: Colors.white,
                )),
      ],
    );
  }
}

class WeatherStatsRow extends StatelessWidget {
  const WeatherStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherStat(icon: Icons.air, label: 'Wind', value: '12 Km/h'),
        WeatherStat(
            icon: Icons.water_drop_outlined, label: 'Humidity', value: '78%'),
        WeatherStat(
            icon: Icons.visibility_outlined, label: 'Visibility', value: '8Km'),
      ],
    );
  }
}
