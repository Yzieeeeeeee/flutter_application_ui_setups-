import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_radius.dart';
import 'package:tisser_application_test/screens/weatherscreen.dart';
import 'package:tisser_application_test/themes/colors.dart';
import 'package:tisser_application_test/widgets/card_stat.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherScreen(),));
    },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.large),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 20,
                offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              child: SizedBox(
                height: 210,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=800',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: Colors.blueGrey.shade100),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(AppRadius.small),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.ac_unit, size: 16),
                                SizedBox(width: 6),
                                Text('-8°C',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text('Temperature\nCurrently',
                                style: TextStyle(
                                    fontSize: 11,
                                    height: 1.2,
                                    color: AppColors.textPrimary)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 14),
                            SizedBox(width: 4),
                            Text('4.8K',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(6, 14, 6, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Overturn Ski Resort',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary)),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 16, color: AppColors.textPrimary),
                      SizedBox(width: 4),
                      Text('Austria, Salzburg',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.textPrimary)),
                    ],
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(6, 0, 6, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardStat(icon: Icons.downhill_skiing, label: '26 Ski runs'),
                  CardStat(icon: Icons.landscape_outlined, label: '112 Km'),
                  CardStat(icon: Icons.groups_outlined, label: '8 Types'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
