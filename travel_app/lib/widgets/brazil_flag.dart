import 'package:flutter/material.dart';

import '../themes/colors.dart';

class BrazilFlagIcon extends StatelessWidget {
  final double size;

  const BrazilFlagIcon({super.key, this.size = 18});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.network(
          'https://flagcdn.com/w80/br.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.flagGreen,
            alignment: Alignment.center,
            child: const Text(
              '🇧🇷',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ),
    );
  }
}
