import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/next_prayer_cubit.dart';
import 'package:islamic/features/home/presentation/view/widgets/ayah_item.dart';
import 'package:islamic/features/home/presentation/view/widgets/category_grid_view.dart';
import 'package:islamic/features/home/presentation/view/widgets/custom_row_two_text.dart';
import 'package:islamic/features/home/presentation/view/widgets/greeting_row.dart';
import 'package:islamic/features/home/presentation/view/widgets/next_prayer.dart';
import 'package:islamic/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locale = Localizations.localeOf(context).languageCode;
      // For example, you can call the loadPrayer function of the NextPrayerCubit
      context.read<NextPrayerCubit>().loadPrayer(locale);
    });
    final tr = S.of(context);
    return Scaffold(
      backgroundColor: ColorManager.darkgreen1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingRow(tr: tr),
                verticalSpace(30),
                NextPrayer(),
                verticalSpace(30),
                CategoryGridView(),
                verticalSpace(10),
                CustomRowTwoText(text1: tr.ayahDay, text2: tr.readMore),
                verticalSpace(15),
                AyahItem(),
                verticalSpace(15),
                CustomRowTwoText(text1: tr.dayHadiths, text2: tr.library),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
