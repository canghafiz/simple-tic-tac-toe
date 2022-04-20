import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FontConfig {
  static const family = "Junegull";

  static style({
    required double size,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: size.sp,
      color: color,
    );
  }
}
