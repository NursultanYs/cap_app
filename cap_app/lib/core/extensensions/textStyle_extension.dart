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

// extension SizedBoxHeight on int {
//   SizedBox createSizedBox({double width = 0}) {
//     return SizedBox(
//       height: toDouble(),
//       width: width,
//     );
//   }
// }
