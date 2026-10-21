import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';
import 'package:tisser_application_test/themes/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, this.title = 'Popular Place'});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style:  AppTypography.heading.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary)),
        TextButton(
          onPressed: () {},
          child:  Text('See all',
              style: AppTypography.seeAll.copyWith( color: AppColors.textPrimary)),
        ),
      ],
    );
  }
}
