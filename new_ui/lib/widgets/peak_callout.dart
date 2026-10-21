import 'package:flutter/material.dart';

/// White tooltip: "Camaieus Peak / 2.5 Km" with a pointer underneath.
class PeakCallout extends StatelessWidget {
  final String title;
  final String distance;
  const PeakCallout({super.key, required this.title, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 14,
                  offset: const Offset(0, 6)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_amber_rounded,
                  size: 24, color: Color(0xFF111827)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827))),
                  const SizedBox(height: 2),
                  Text(distance,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF6D7884))),
                ],
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -6),
          child: Transform.rotate(
            angle: 0.785398,
            child: Container(width: 12, height: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
