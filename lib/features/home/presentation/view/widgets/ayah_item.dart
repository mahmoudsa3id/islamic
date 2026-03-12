import 'package:flutter/material.dart';
import 'package:islamic/constant.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/core/theming/text_style.dart';
import 'package:islamic/generated/l10n.dart';

class AyahItem extends StatelessWidget {
  const AyahItem({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 1, color: ColorManager.yellow),
        color: ColorManager.darkgreen2,
        borderRadius: BorderRadius.circular(20),
      ),
      height: height(context) * 0.25,
      width: width(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.darkgreenbrown,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tr.ayahDay,
                  style: TextStyleManager.bold20(context),
                ),
              ),
              CircleAvatar(
                radius: 22,
                backgroundColor: ColorManager.darkgreenbrown,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow, color: ColorManager.yellow),
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'إِنَّ مَعَ الْعُسْرِ يُسْرًا',
                style: TextStyleManager.bold20(context),
              ),
              verticalSpace(10),
              Text(
                "\"Indeed, with hardship will be ease.\"",
                style: TextStyleManager.medium15bluegrey(context),
              ),
              verticalSpace(15),

              Text(
                'Surah Ash-Sharh, 94:6',
                style: TextStyleManager.yellowSemiBold20(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
