import 'package:flutter/material.dart';

class ColorManager {

  static Color scaffoldColor = HexColor.fromHex("#F5F5F5");
  static Color textColor = HexColor.fromHex("#000000");
  static Color colorAgainstDarkBg = HexColor.fromHex("#FFFFFF");
  static Color feedBackError = HexColor.fromHex("#F44336");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}