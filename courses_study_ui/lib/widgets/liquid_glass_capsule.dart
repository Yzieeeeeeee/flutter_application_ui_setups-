import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

/// Custom mathematical liquid glass painter that simulates:
// 1. Fresnel edge reflection (Snell's Law / grazing angle illumination)
// 2. lens reflection
//3. (refracted light focus
/// 4. Sub-surface ambient scattering
class LiquidGlassPainter extends CustomPainter {
  /// Light source angle
  final double lightAngle;

  /// Corner radius of the capsule
  final double borderRadius;

  /// Tint opacity of the glass base
  final Color baseColor;

  /// Specular highlight intensity
  final double specularIntensity;

  /// Rim refraction intensity
  final double refractionIntensity;

  const LiquidGlassPainter({
    this.lightAngle = -math.pi / 3,
    this.borderRadius = 34.0,
    this.baseColor = Colors.white,
    this.specularIntensity = 1.0,
    this.refractionIntensity = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // Clip to capsule boundary so all effects remain crisp
    canvas.save();
    canvas.clipRRect(rrect);

    // ==========================================
    // 1. BASE LIQUID GLASS BODY & SUB-SURFACE TINT
    // ==========================================
    final basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          baseColor.withValues(alpha: 0.08),
          baseColor.withValues(alpha: 0.02),
          baseColor.withValues(alpha: 0.12),
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(rect);
    canvas.drawRRect(rrect, basePaint);

    // ==========================================
    // 2. MATHEMATICAL CAUSTIC LIGHT BAND (Internal Refraction Rib)
    // Simulates caustic concentration where light rays cross through convex glass
    // ==========================================
    final causticPath = Path();
    causticPath.moveTo(size.width * 0.12, 0);
    causticPath.cubicTo(
      size.width * 0.32,
      size.height * 0.25,
      size.width * 0.48,
      size.height * 0.75,
      size.width * 0.68,
      size.height,
    );
    causticPath.lineTo(size.width * 0.76, size.height);
    causticPath.cubicTo(
      size.width * 0.54,
      size.height * 0.70,
      size.width * 0.38,
      size.height * 0.20,
      size.width * 0.18,
      0,
    );
    causticPath.close();

    final causticPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.14 * refractionIntensity),
          const Color(0xFFFFBDE3).withValues(alpha: 0.08 * refractionIntensity),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(rect)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawPath(causticPath, causticPaint);


    // 3. CONVEX SPECULAR APEX SHE

    final sheenRect = Rect.fromLTWH(
      size.width * 0.04,
      1.0,
      size.width * 0.92,
      size.height * 0.42,
    );
    final sheenRRect = RRect.fromRectAndRadius(
      sheenRect,
      Radius.circular(borderRadius * 0.6),
    );

    final sheenPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withValues(alpha: 0.30 * specularIntensity),
          Colors.white.withValues(alpha: 0.05 * specularIntensity),
          Colors.transparent,
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(sheenRect);
    canvas.drawRRect(sheenRRect, sheenPaint);

    // ==========================================
    // 4. SECONDARY BOTTOM AMBIENT BOUNCE (Ground Caustic Reflection)
    // Subtle upward transmission from background ambient light
    // ==========================================
    // final bottomGlowRect = Rect.fromLTWH(
    //   size.width * 0.15,
    //   size.height * 0.70,
    //   size.width * 0.70,
    //   size.height * 0.30,
    // );
    // final bottomGlowPaint = Paint()
    //   ..shader = RadialGradient(
    //     center: const Alignment(0.0, 1.2),
    //     radius: 1.0,
    //     colors: [
    //       const Color(0xFFC04F8A).withValues(alpha: 0.16),
    //       Colors.transparent,
    //     ],
    //   ).createShader(bottomGlowRect);
    // canvas.drawRect(bottomGlowRect, bottomGlowPaint);


    // 5. FRESNEL RIM

    final rimPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..shader = SweepGradient(
        center: Alignment.center,
        startAngle: 0.0,
        endAngle: math.pi * 2,
        colors: [
          Colors.white.withValues(alpha: 0.45 * specularIntensity), // Top-left high spec
          Colors.white.withValues(alpha: 0.15),
          Colors.white.withValues(alpha: 0.08), // Shadow edge
          Colors.white.withValues(alpha: 0.25), // Bottom rim bounce
          Colors.white.withValues(alpha: 0.45 * specularIntensity),
        ],
        stops: const [0.0, 0.28, 0.55, 0.82, 1.0],
        transform: GradientRotation(lightAngle),
      ).createShader(rect);
    canvas.drawRRect(rrect.deflate(0.6), rimPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant LiquidGlassPainter oldDelegate) => false;
}

/// A liquid glass capsule  ()
class LiquidGlassCapsule extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;


  const LiquidGlassCapsule({
    super.key,
    required this.child,
    this.borderRadius = 34.0,
    this.width,
    this.height,
    this.padding,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          // Deep drop shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),

        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: CustomPaint(
            painter: LiquidGlassPainter(
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
