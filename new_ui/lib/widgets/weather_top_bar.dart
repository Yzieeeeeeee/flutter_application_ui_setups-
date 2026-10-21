import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_typo.dart';
import 'package:tisser_application_test/themes/colors.dart';

class WeatherTopBar extends StatelessWidget {
  const WeatherTopBar({super.key});

  Widget _circle(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
            color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, size: 20, color: WeatherColors.textDark),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _circle(Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.maybePop(context)),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            color: WeatherColors.glass,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: WeatherColors.glassBorder),
          ),
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: Colors.white),
              SizedBox(width: 6),
              Text('Explore new places',
                  style: AppTypography.button.copyWith(
                      color: Colors.white,
                      )),
            ],
          ),
        ),
        const Spacer(),
        _circle(Icons.more_vert),
      ],
    );
  }
}
