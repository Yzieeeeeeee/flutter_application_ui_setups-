import 'package:flutter/material.dart';
import 'package:tisser_application_test/widgets/mountain_info.dart';
import 'package:tisser_application_test/widgets/peak_callout.dart';
import 'package:tisser_application_test/widgets/round_icon_button.dart';

class MountainScreen extends StatelessWidget {
  const MountainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://wallpaperaccess.com/full/93182.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF3B6FA8)),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0x55000000)],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () => Navigator.maybePop(context),
                      ),
                      const RoundIconButton(icon: Icons.favorite_border),
                    ],
                  ),
                  const Align(
                    alignment: Alignment(-0.1, -0.78),
                    child: PeakCallout(
                        title: 'Himalayan Ranges', distance: '2.5 Km'),
                  ),
                  const Align(
                    alignment: Alignment(-1, 0.28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GlassIconButton(icon: Icons.tune),
                        SizedBox(height: 10),
                        GlassIconButton(icon: Icons.navigation_outlined),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: MountainInfoCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}