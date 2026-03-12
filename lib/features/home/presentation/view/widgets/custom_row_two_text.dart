import 'package:flutter/material.dart';
import 'package:islamic/core/theming/text_style.dart';

class CustomRowTwoText extends StatelessWidget {
  const CustomRowTwoText({super.key, required this.text2, required this.text1});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(text1, style: TextStyleManager.bold20(context)),
        Text(text2, style: TextStyleManager.yellowSemiBold20(context)),
      ],
    );
  }
}
