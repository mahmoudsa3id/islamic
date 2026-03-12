import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic/core/theming/colors.dart';

class PrayerCountdown extends StatefulWidget {
  final String prayerTime;

  const PrayerCountdown({super.key, required this.prayerTime});

  @override
  State<PrayerCountdown> createState() => _PrayerCountdownState();
}

class _PrayerCountdownState extends State<PrayerCountdown> {
  Duration remaining = Duration.zero;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    calculate();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      calculate();
    });
  }

  void calculate() {
    final now = DateTime.now();
    final parts = widget.prayerTime.split(":");

    DateTime prayer = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );

    /// لو وقت الصلاة عدى النهارده نخليه بكرة
    if (prayer.isBefore(now)) {
      prayer = prayer.add(const Duration(days: 1));
    }

    setState(() {
      remaining = prayer.difference(now);
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

    return Text(
      "$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}",
      style: TextStyle(
        fontSize: 14,
        color: ColorManager.yellow,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
