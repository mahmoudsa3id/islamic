import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/core/theming/text_style.dart';
import 'package:islamic/core/widgets/custom_circle_icon.dart';

class HeaderPrayer extends StatelessWidget {
  const HeaderPrayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('مواقيت الصلاة', style: TextStyleManager.bold20(context)),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.locationDot,
                  color: ColorManager.yellow,
                  size: 15,
                ),
                horizontalSpace(8),

                Text(
                  'المدينة',
                  style: TextStyleManager.medium20bluegrey(context),
                ),
              ],
            ),
          ],
        ),
        const CustomCircleIcon(
          borderColor: ColorManager.yellow,
          backgroundColor: ColorManager.darkgreen2,
          icon: FontAwesomeIcons.sliders,
        ),
      ],
    );
  }
}
