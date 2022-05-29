import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle primaryStyle(
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  FontStyle? fontStyle,
) {
  return GoogleFonts.lato(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
  );
}
TextStyle secondaryStyle(
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  FontStyle? fontStyle,
) {
  return GoogleFonts.poppins(
    
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
  );
}
