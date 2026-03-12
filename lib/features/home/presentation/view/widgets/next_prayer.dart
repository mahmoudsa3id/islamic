import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:islamic/constant.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/core/theming/text_style.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/next_prayer_cubit.dart';
import 'package:islamic/features/home/presentation/view/widgets/prayer_count_down.dart';
import 'package:islamic/generated/l10n.dart';

class NextPrayer extends StatelessWidget {
  const NextPrayer({super.key});

  String formatTime(String time) {
    try {
      final cleanTime = time.split(" ").first;

      final parts = cleanTime.split(":");

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final date = DateTime(0, 0, 0, hour, minute);

      return DateFormat("hh:mm a").format(date);
    } catch (e) {
      return "--:--";
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return BlocBuilder<NextPrayerCubit, NextPrayerState>(
      builder: (context, state) {
        String prayerName = "...";
        String prayerTime = "--:--";
        String address = "...";
        String hijri = "...";
        int currentPrayerIndex = 0;

        final prayerNames = [tr.fajr, tr.dhuhr, tr.asr, tr.maghrib, tr.isha];

        if (state is NextPrayerLoaded) {
          late final prayerTimes = [
            state.prayer.fajr,
            state.prayer.dhuhr,
            state.prayer.asr,
            state.prayer.maghrib,
            state.prayer.isha,
          ];

          currentPrayerIndex = state.nextIndex;
          prayerName = prayerNames[currentPrayerIndex];
          prayerTime = prayerTimes[currentPrayerIndex];
          address = state.address;
          hijri = state.prayer.hijri.formatted(
            Localizations.localeOf(context).languageCode,
          );
        }

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: ColorManager.yellow),
            color: ColorManager.darkgreen2,
            borderRadius: BorderRadius.circular(40),
          ),
          height: height(context) * 0.3,
          width: width(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.nextPrayer,
                        style: TextStyleManager.medium15bluegrey(context),
                      ),

                      verticalSpace(10),

                      Text(
                        prayerName,
                        style: TextStyleManager.yellowSemiBold20(context),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// TIME WITH AM PM
                      Text(
                        prayerTime == "--:--"
                            ? prayerTime
                            : formatTime(prayerTime),
                        style: TextStyleManager.bold30yellow(context),
                      ),

                      verticalSpace(4),

                      /// COUNTDOWN
                      if (state is NextPrayerLoaded)
                        PrayerCountdown(prayerTime: prayerTime),

                      verticalSpace(6),

                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.locationDot,
                            size: 15,
                            color: ColorManager.yellow,
                          ),
                          Text(
                            address,
                            style: TextStyleManager.medium15bluegrey(
                              context,
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              verticalSpace(5),

              /// HIJRI DATE
              Text(hijri, style: TextStyleManager.yellowSemiBold20(context)),
              horizontalSpace(4),

              const Spacer(),

              /// PRAYER PROGRESS
              Column(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      Color color;

                      if (index < currentPrayerIndex) {
                        color = ColorManager.borderprofilecolor;
                      } else if (index == currentPrayerIndex) {
                        color = ColorManager.yellow;
                      } else {
                        color = ColorManager.darkGrey;
                      }

                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 5,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }),
                  ),

                  verticalSpace(3),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: prayerNames.map((name) {
                      return Text(name);
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
