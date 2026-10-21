import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color scaffoldBackground = Color(0xFF131019);
  static const Color darkCard = Color(0xFF1D1926);
  static const Color darkCardSecondary = Color(0xFF252031);
  static const Color darkCardBorder = Color(0xFF2E283C);

  // Gradient Colors
  static const Color magentaBright = Color(0xFFE277A8);
  static const Color magentaMedium = Color(0xFFA43B77);
  static const Color purpleDeep = Color(0xFF541D4E);
  static const Color plumDark = Color(0xFF261229);

  // Warm Yellow / Amber accents (seen on right edge of Schedule screen)
  static const Color amberGlow = Color(0xFFE59436);
  static const Color warmYellow = Color(0xFFEDB84D);
  static const Color oliveRing = Color(0xFF6B7536);

  // Accent Colors
  static const Color neonYellow = Color(0xFFD5F34E); // Calendar ring active
  static const Color starGold = Color(0xFFFFB800);
  static const Color activeBadge = Colors.white;
  static const Color activeBadgeText = Color(0xFF131019);

  // Text Colors
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFFE0DCED);
  static const Color textGrey = Color(0xFF9C96A8);
  static const Color textMuted = Color(0xFF6E687A);

  // Glass / Overlay
  static final Color glassWhite = Colors.white.withValues(alpha: 0.12);
  static final Color glassWhiteLight = Colors.white.withValues(alpha: 0.07);
  static final Color glassBorder = Colors.white.withValues(alpha: 0.14);
  static final Color navBarBackground = const Color(0xFF181423).withValues(alpha: 0.82);

  // Gradients
  static const LinearGradient featuredGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFDF80AE),
      Color(0xFFA63973),
      Color(0xFF4C1844),
      Color(0xFF1F1023),
    ],
  );

  static const LinearGradient scheduleActiveGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFA63A76),
      Color(0xFF6B225A),
      Color(0xFF331435),
    ],
  );

  static const LinearGradient bottomFadeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0xE6131019),
      Color(0xFF131019),
    ],
  );
}
