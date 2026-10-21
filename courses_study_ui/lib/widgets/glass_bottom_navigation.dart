import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class NavigationBarItem {
  final IconData icon;
  final String label;

  const NavigationBarItem({required this.icon, required this.label});
}

class GlassBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const GlassBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  static const List<NavigationBarItem> items = [
    NavigationBarItem(icon: Icons.home_rounded, label: 'Home'),
    NavigationBarItem(icon: Icons.chat_bubble_outline_rounded, label: 'Messages'),
    NavigationBarItem(icon: Icons.explore_outlined, label: 'Explore'),
    NavigationBarItem(icon: Icons.settings_outlined, label: 'Settings'),
    NavigationBarItem(icon: Icons.search_rounded, label: 'Search'),
  ];

  @override
  State<GlassBottomNavigation> createState() => _GlassBottomNavigationState();
}

class _GlassBottomNavigationState extends State<GlassBottomNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _animCurve;

  int _previousIndex = 0;
  int _targetIndex = 0;

  @override
  void initState() {
    super.initState();
    _previousIndex = widget.currentIndex;
    _targetIndex = widget.currentIndex;

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );

    _animCurve = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
    );

    _animController.value = 1.0;
  }

  @override
  void didUpdateWidget(covariant GlassBottomNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _previousIndex = _targetIndex;
      _targetIndex = widget.currentIndex;
      _animController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _handleTap(int index) {
    if (index == widget.currentIndex) return;
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        const double navHeight = 76.0;
        final itemCount = GlassBottomNavigation.items.length;
        final slotWidth = totalWidth / itemCount;

        const double pillWidth = 60.0;
        const double pillHeight = 52.0;

        return Container(
          height: navHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.0),
            // Ultra-sheer base to let background colors completely through
            color: Colors.white.withValues(alpha: 0.03),
            border: Border.all(
              // Sharp edge lighting
              color: Colors.white.withValues(alpha: 0.15),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(34.0),
            child: BackdropFilter(
              // Intense blur to smoothly diffuse the carousel imagery
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: AnimatedBuilder(
                animation: _animController,
                builder: (context, child) {
                  final t = _animCurve.value;

                  final startX = (_previousIndex + 0.5) * slotWidth;
                  final endX = (_targetIndex + 0.5) * slotWidth;
                  final currentCenterX = startX + (endX - startX) * t;

                  final distance = (_targetIndex - _previousIndex).abs();
                  final velocityFactor = math.min(distance.toDouble(), 3.0);
                  final rawStretch = math.sin(math.pi * _animController.value.clamp(0.0, 1.0));
                  final stretchFactor = rawStretch * (0.28 * velocityFactor);

                  final dynamicPillWidth = pillWidth * (1.0 + stretchFactor);
                  final dynamicPillHeight = pillHeight * (1.0 - stretchFactor * 0.32);

                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      // ==========================================
                      // 1. LIQUID GLASS DROPLET INDICATOR
                      // ==========================================
                      Positioned(
                        left: currentCenterX - (dynamicPillWidth / 2),
                        top: (navHeight - dynamicPillHeight) / 2,
                        child: Container(
                          width: dynamicPillWidth,
                          height: dynamicPillHeight,
                          decoration: BoxDecoration(
                            // Brighter frosted highlight for the active pill
                            color: Colors.white.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(dynamicPillHeight / 2),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.35),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.12),
                                blurRadius: 10,
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Specular gleam on the top curve
                              Positioned(
                                top: 2,
                                left: dynamicPillWidth * 0.15,
                                right: dynamicPillWidth * 0.15,
                                height: dynamicPillHeight * 0.45,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(dynamicPillHeight / 2),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white.withValues(alpha: 0.50),
                                        Colors.white.withValues(alpha: 0.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ==========================================
                      // 2. CRISP WHITE ICONS
                      // ==========================================
                      Row(
                        children: List.generate(itemCount, (index) {
                          final isSelected = index == widget.currentIndex;
                          final item = GlassBottomNavigation.items[index];

                          return Expanded(
                            child: GestureDetector(
                              onTap: () => _handleTap(index),
                              behavior: HitTestBehavior.opaque,
                              child: Center(
                                child: AnimatedScale(
                                  scale: isSelected ? 1.08 : 1.0,
                                  duration: const Duration(milliseconds: 200),
                                  child: Icon(
                                    item.icon,
                                    size: 28,
                                    // High contrast pure white for visibility
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white.withValues(alpha: 0.70),
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
      },
    );
  }
}