import "package:flutter/material.dart";

extension TextStyleExtension on TextStyle {
  TextStyle withFontSize(double fontSize) {
    return this.copyWith(fontSize: fontSize);
  }
}

extension TextColorExtension on TextStyle {
  TextStyle withColor(Color color) {
    return this.copyWith(color: color);
  }
}

extension TextFamilyExtension on TextStyle {
  TextStyle withFamily(String family) {
    return this.copyWith(fontFamily: family);
  }
}
