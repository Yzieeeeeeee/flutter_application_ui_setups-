import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';
import 'package:tisser_application_test/themes/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning ',
                  style: TextStyle(color: AppColors.surface, fontSize: 14)),
              SizedBox(height: 4),
              Text('Muhammed Yasir',
                  style: AppTypography.heading.copyWith(
                      color: AppColors.surface,
                    )),
            ],
          ),
        ),
        Stack(
          children: [
            const CircleAvatar(
              radius: 21,
              backgroundColor: Colors.white,
              child: Icon(Icons.notifications_none_rounded,
                  color: AppColors.textPrimary),
            ),
            Positioned(
              top: 11,
              right: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          radius: 21,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
