import 'package:flutter/material.dart';
import 'package:tisser_application_test/themes/colors.dart';

class _Hour {
  final String time;
  final IconData icon;
  final Color color;
  final String temp;
  const _Hour(this.time, this.icon, this.color, this.temp);
}

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  static const _hours = [
    _Hour('Now', Icons.cloud, Colors.white, '-11°'),
    _Hour('1 PM', Icons.wb_cloudy, Colors.white, '-12°'),
    _Hour('2 PM', Icons.wb_sunny, Color(0xFFFFB300), '-13°'),
    _Hour('3 PM', Icons.wb_cloudy, Colors.white, '-13°'),
    _Hour('4 PM', Icons.cloud, Colors.white, '-14°'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: WeatherColors.glass,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: WeatherColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.access_time, size: 17, color: Colors.white),
              SizedBox(width: 6),
              Text('Next 24 hours',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _hours
                .map((h) => Column(
                      children: [
                        Text(h.time,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                        Icon(h.icon, size: 26, color: h.color),
                        const SizedBox(height: 10),
                        Text(h.temp,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
