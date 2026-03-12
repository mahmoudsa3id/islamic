import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic/core/helper/spacing.dart';
import 'package:islamic/core/theming/colors.dart';

class PrayerCountdown extends StatefulWidget {
  final String prayerTime;

  const PrayerCountdown({super.key, required this.prayerTime});

  @override
  State<PrayerCountdown> createState() => _PrayerCountdownState();
}

class _PrayerCountdownState extends State<PrayerCountdown> {
  Duration remaining = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    calculateInitial();
    startTimer();
  }

  /// حساب الفرق مرة واحدة فقط
  void calculateInitial() {
    final now = DateTime.now();

    final cleanTime = widget.prayerTime.split(" ").first;
    final parts = cleanTime.split(":");

    DateTime prayer = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );

    if (prayer.isBefore(now)) {
      prayer = prayer.add(const Duration(days: 1));
    }

    remaining = prayer.difference(now);
  }

  /// تقليل الوقت كل ثانية
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        remaining = remaining - const Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = remaining.inHours;
    final m = remaining.inMinutes % 60;
    final s = remaining.inSeconds % 60;

    return Row(
      children: [
        Icon(FontAwesomeIcons.powerOff, size: 10, color: ColorManager.darkGrey),
        horizontalSpace(5),
        Text(
          "$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}",
          style: TextStyle(
            fontSize: 14,
            color: ColorManager.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
