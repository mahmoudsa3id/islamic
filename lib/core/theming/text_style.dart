import 'package:flutter/material.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/core/theming/responsive_text.dart';

class TextStyleManager {
  static TextStyle medium15bluegrey(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: const Color(0xff75AD88),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium20bluegrey(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: const Color(0xff75AD88),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold30yellow(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      color: ColorManager.yellow,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bold20yellow(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: ColorManager.yellow,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle yellowSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: ColorManager.yellow,
      fontWeight: FontWeight.w600,
    );
  }
}
