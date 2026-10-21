import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Typo{

// for the display section 

  static TextStyle get heroTitle => GoogleFonts.bebasNeue(
    fontSize: 44,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.0,
    height: 0.95,
  );

  static TextStyle get cardTitle => GoogleFonts.bebasNeue(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
    height: 1.0,
  );

  static final TextStyle  sectionHeading = GoogleFonts.spaceGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static final TextStyle pillBadge = GoogleFonts.spaceGrotesk(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static final TextStyle  pillBadgeContent = GoogleFonts.anton(
    fontSize: 44,
    height: 0.98,
    
  );

  static final TextStyle statBadge = GoogleFonts.spaceGrotesk(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    
  );
  // static TextStyle get statValue => GoogleFonts.plusJakartaSans(
  //   fontSize: 28,
  //   fontWeight: FontWeight.w700,
  // );

  static final TextStyle  buttonText = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
  );
  static final TextStyle classItem = GoogleFonts.spaceGrotesk(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}