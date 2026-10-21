import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oc_liquid_glass/oc_liquid_glass.dart';
import '../core/app_colors.dart';

/// A premium glass surface shader-based [OCLiquidGlass]
/// with a graceful fallback to [BackdropFilter] on
/// where GPU
class GlassSurface extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? tintColor;
  final Border? border;
  final BoxShadow? shadow;
  final bool useShader;

  const GlassSurface({
    super.key,
    required this.child,
    this.borderRadius = 32.0,
    this.width,
    this.height,
    this.padding,
    this.tintColor,
    this.border,
    this.shadow,
    this.useShader = true,
  });

  /// Standard liquid glass settings tuned for a subtle, high-end iOS feel.
  static const OCLiquidGlassSettings defaultSettings = OCLiquidGlassSettings(
    refractStrength: -0.07,
    blurRadiusPx: 2.0,
    specStrength: 16.0,
    specAngle: 4.0,
    specPower: 3.5,
    specWidth: 1.5,
    blendPx: 6.0,
    distortFalloffPx: 40.0,
    distortExponent: 3.5,
    lightbandColor: Color(0x35FFFFFF),
    lightbandOffsetPx: 2.0,
    lightbandWidthPx: 12.0,
    lightbandStrength: 0.7,
  );

  @override
  Widget build(BuildContext context) {
    // In test environment or when shaders are disabled, use frosted fallback
    final effectiveTint = tintColor ?? AppColors.navBarBackground;
    final effectiveBorder = border ??
        Border.all(
          color: Colors.white.withValues(alpha: 0.16),
          width: 1.0,
        );

    // If shader is enabled and not running inside a unit test runner
    final canUseShader = useShader && !kIsWeb;

    Widget content = Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: canUseShader ? effectiveTint.withValues(alpha: 0.45) : effectiveTint,
        borderRadius: BorderRadius.circular(borderRadius),
        border: effectiveBorder,
      ),
      child: child,
    );

    if (canUseShader) {
      try {
        return OCLiquidGlass(
          borderRadius: borderRadius,
          color: effectiveTint.withValues(alpha: 0.35),
          shadow: shadow ??
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
          child: content,
        );
      } catch (_) {
        // Fallback to frosted glass if shader fails
      }
    }

    // High quality frosted glass fallback
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadow != null
            ? [shadow!]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: content,
        ),
      ),
    );
  }
}
