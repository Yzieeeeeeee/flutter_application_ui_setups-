import 'dart:ui';
import 'package:flutter/material.dart';

/// Reusable frosted-glass surface.
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final BoxShape shape;

  const GlassContainer({
    super.key,
    required this.child,
    this.radius = 24,
    this.padding = EdgeInsets.zero,
    this.opacity = 0.22,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    final isCircle = shape == BoxShape.circle;
    final decoration = BoxDecoration(
      color: Colors.white.withOpacity(opacity),
      shape: shape,
      borderRadius: isCircle ? null : BorderRadius.circular(radius),
      border: Border.all(color: Colors.white.withOpacity(0.45)),
    );
    final blurred = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
      child: Container(padding: padding, decoration: decoration, child: child),
    );
    return isCircle
        ? ClipOval(child: blurred)
        : ClipRRect(borderRadius: BorderRadius.circular(radius), child: blurred);
  }
}
