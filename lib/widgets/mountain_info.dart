
import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';
import 'package:tisser_application_test/widgets/glass_container.dart';
import 'package:tisser_application_test/widgets/info_stat.dart';
import 'package:tisser_application_test/widgets/round_icon_button.dart';

/// Bottom frosted card with title, stats and the AR button.
class MountainInfoCard extends StatelessWidget {
  const MountainInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: 26,
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('The himalayan Ranges',
                        style: AppTypography.body.copyWith(
                            color: Colors.white,
                            )),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 15, color: Colors.white),
                        SizedBox(width: 6),
                        Text('Chamo, France',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const GlassIconButton(
                  icon: Icons.bookmark_border_rounded, size: 46),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoStat(value: '-11°C', label: 'Temperature'),
              InfoStat(value: '4 m/s', label: 'Wind'),
              InfoStat(value: '87%', label: 'Humidity'),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.center_focus_strong_outlined,
                  size: 18, color: Color(0xFF111827)),
              label:  Text('Start AR Navigation',
                  style: AppTypography.body.copyWith(
                      color: Color(0xFF111827),)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
