import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/next_prayer_cubit.dart';
import 'package:islamic/features/home/presentation/view/widgets/ayah_item.dart';
import 'package:islamic/features/home/presentation/view/widgets/category_grid_view.dart';
import 'package:islamic/features/home/presentation/view/widgets/custom_row_two_text.dart';
import 'package:islamic/features/home/presentation/view/widgets/greeting_row.dart';
import 'package:islamic/features/home/presentation/view/widgets/next_prayer.dart';
import 'package:islamic/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isLoaded) {
      final locale = Localizations.localeOf(context).languageCode;
      context.read<NextPrayerCubit>().loadPrayer(locale);
      _isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          final locale = Localizations.localeOf(context).languageCode;
          await context.read<NextPrayerCubit>().loadPrayer(locale);
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            GreetingRow(tr: tr),
            verticalSpace(30),
            const NextPrayer(),
            verticalSpace(30),
            const CategoryGridView(),
            verticalSpace(10),
            CustomRowTwoText(text1: tr.ayahDay, text2: tr.readMore),
            verticalSpace(15),
            const AyahItem(),
            verticalSpace(15),
            CustomRowTwoText(text1: tr.dayHadiths, text2: tr.library),
          ],
        ),
      ),
    );
  }
}
