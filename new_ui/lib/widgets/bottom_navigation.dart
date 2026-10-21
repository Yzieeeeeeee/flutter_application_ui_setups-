import 'package:flutter/material.dart';
import 'package:tisser_application_test/core/constants/app_radius.dart';
import 'package:tisser_application_test/themes/colors.dart';

class FloatingBottomNav extends StatefulWidget {
  const FloatingBottomNav({super.key});

  @override
  State<FloatingBottomNav> createState() => _FloatingBottomNavState();
}

class _FloatingBottomNavState extends State<FloatingBottomNav> {
  int selected = 0;

  final List<IconData> icons = const [
    Icons.home_filled,
    Icons.map_outlined,
    Icons.search,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 48,
          width: 190,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / icons.length;

              return Stack(
                children: [
                  // Moving selected indicator
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    left: selected * itemWidth,
                    top: 5,
                    width: itemWidth,
                    height: 38, 
                    child: Center(
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  // Navigation icons
                  Row(
                    children: List.generate(icons.length, (index) {
                      final active = selected == index;

                      return SizedBox(
                        width: itemWidth,
                        height: 48,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Center(
                            child: AnimatedScale(
                              scale: active ? 1.05 : 1.0,
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                icons[index],
                                size: 21,
                                color: active
                                    ? Colors.white
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}