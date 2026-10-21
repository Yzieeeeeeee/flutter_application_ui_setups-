import 'package:flutter/material.dart';
import 'package:tisser_application_test/widgets/glass_container.dart';

/// White circle button (back / favourite).
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const RoundIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, size: 20, color: const Color(0xFF111827)),
      ),
    );
  }
}

/// Small frosted circle button (left side controls / bookmark).
class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onTap;
  const GlassIconButton(
      {super.key, required this.icon, this.size = 40, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: GlassContainer(
          shape: BoxShape.circle,
          opacity: 0.25,
          child: Icon(icon, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}
