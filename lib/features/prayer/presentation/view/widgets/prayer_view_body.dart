import 'package:flutter/material.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/features/prayer/presentation/view/widgets/header_prayer.dart';

class PrayerViewBody extends StatelessWidget {
  const PrayerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [verticalSpace(5), const HeaderPrayer()],
          ),
        ),
      ),
    );
  }
}
