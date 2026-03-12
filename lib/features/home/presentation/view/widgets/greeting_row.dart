import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/core/theming/text_style.dart';
import 'package:islamic/core/widgets/custom_circle_icon.dart';
import 'package:islamic/generated/l10n.dart';

class GreetingRow extends StatelessWidget {
  const GreetingRow({super.key, required this.tr});

  final S tr;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              tr.greeting,
              style: TextStyleManager.medium15bluegrey(context),
            ),
            verticalSpace(10),
            Text('محمود سعيد', style: TextStyleManager.bold20(context)),
          ],
        ),
        Spacer(),

        Stack(
          children: [
            CustomCircleIcon(
              borderColor: ColorManager.borderprofilecolor,
              backgroundColor: ColorManager.darkgreenbrown,
              icon: FontAwesomeIcons.bell,
            ),
            Positioned(
              child: CircleAvatar(
                backgroundColor: ColorManager.yellow,
                radius: 6,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
