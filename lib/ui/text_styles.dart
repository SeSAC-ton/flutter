import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart' show TextStyle;
import 'package:google_fonts/google_fonts.dart';

abstract class Fonts {
  static TextStyle _baseStyle(double fontSize, FontWeight fontWeight, double height) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: 0,
    );
  }

  static TextStyle tittleTextBold = _baseStyle(50, FontWeight.bold, 75 / 50);
  static TextStyle headerTextBold = _baseStyle(30, FontWeight.bold, 45 / 30);
  static TextStyle largeTextBold = _baseStyle(20, FontWeight.bold, 30 / 20);
  static TextStyle mediumTextBold = _baseStyle(18, FontWeight.bold, 27 / 18);
  static TextStyle normalTextBold = _baseStyle(16, FontWeight.bold, 24 / 16);
  static TextStyle smallTextBold = _baseStyle(14, FontWeight.bold, 21 / 14);
  static TextStyle smallerTextBold = _baseStyle(11, FontWeight.bold, 17 / 11);

  static TextStyle tittleTextRegular = _baseStyle(50, FontWeight.normal, 75 / 50);
  static TextStyle headerTextRegular = _baseStyle(30, FontWeight.normal, 45 / 30);
  static TextStyle largeTextRegular = _baseStyle(20, FontWeight.normal, 30 / 20);
  static TextStyle mediumTextRegular = _baseStyle(18, FontWeight.normal, 27 / 18);
  static TextStyle normalTextRegular = _baseStyle(16, FontWeight.normal, 24 / 16);
  static TextStyle smallTextRegular = _baseStyle(14, FontWeight.normal, 21 / 14);
  static TextStyle smallerTextRegular = _baseStyle(11, FontWeight.normal, 17 / 11);

  static TextStyle tittleTextSemiBold = _baseStyle(50, FontWeight.w500, 75 / 50);
  static TextStyle headerTextSemiBold = _baseStyle(30, FontWeight.w500, 45 / 30);
  static TextStyle largeTextSemiBold = _baseStyle(20, FontWeight.w500, 30 / 20);
  static TextStyle mediumTextSemiBold = _baseStyle(18, FontWeight.w500, 27 / 18);
  static TextStyle normalTextSemiBold = _baseStyle(16, FontWeight.w500, 24 / 16);
  static TextStyle smallTextSemiBold = _baseStyle(14, FontWeight.w500, 21 / 14);
  static TextStyle smallerTextSemiBold = _baseStyle(11, FontWeight.w500, 17 / 11);
}