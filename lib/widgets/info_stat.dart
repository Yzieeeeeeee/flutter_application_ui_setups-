import 'package:flutter/material.dart';

/// Value on top, label below (white text) - Temperature / Wind / Humidity.
class InfoStat extends StatelessWidget {
  final String value;
  final String label;
  const InfoStat({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 12)),
      ],
    );
  }
}
