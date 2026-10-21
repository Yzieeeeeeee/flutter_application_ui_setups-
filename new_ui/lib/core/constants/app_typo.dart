import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography{
  static final TextStyle heading = GoogleFonts.poppins(
    fontSize : 20,
    fontWeight : FontWeight.w700
  );

  static final TextStyle body = GoogleFonts.poppins(
    fontSize : 18,
    fontWeight : FontWeight.w400,);

    static final TextStyle button = GoogleFonts.plusJakartaSans(
    fontSize : 18,
    fontWeight : FontWeight.w500,);


  static final TextStyle searchSection = GoogleFonts.plusJakartaSans(
    fontSize : 15,
    fontWeight : FontWeight.w400,);


static final TextStyle seeAll = GoogleFonts.poppins(
    fontSize : 15,
    fontWeight : FontWeight.w700,);

static final TextStyle subBody = GoogleFonts.poppins(
    fontSize : 12,
    fontWeight : FontWeight.w400,);

static final TextStyle location = GoogleFonts.poppins(
    fontSize : 14,
    fontWeight : FontWeight.w700,);
}