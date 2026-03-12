import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/core/theming/colors.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/language_cubit.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/next_prayer_cubit.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon({
    super.key,
    required this.borderColor,
    required this.backgroundColor,
    this.onPressed,
    required this.icon,
  });
  final Color borderColor;
  final Color backgroundColor;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: borderColor,
      radius: 24,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 22,
        child: IconButton(
          onPressed: () {
            final current = context.read<LanguageCubit>().state.languageCode;

            final newLocale = current == 'ar' ? 'en' : 'ar';

            context.read<LanguageCubit>().changeLanguage();

            context.read<NextPrayerCubit>().loadPrayer(newLocale);
          },
          icon: Icon(icon),
          iconSize: 15,
          color: ColorManager.yellow,
        ),
      ),
    );
  }
}
