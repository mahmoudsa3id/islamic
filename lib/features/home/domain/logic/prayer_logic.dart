import 'package:islamic/features/home/domain/entity/prayer_entity.dart';
import 'prayer_time_parser.dart';

int getNextPrayerIndex(PrayerEntity prayer) {
  final now = DateTime.now();

  final prayerTimes = [
    prayer.fajr,
    prayer.dhuhr,
    prayer.asr,
    prayer.maghrib,
    prayer.isha,
  ];

  for (int i = 0; i < prayerTimes.length; i++) {
    final prayerTime = parsePrayerTime(prayerTimes[i]);

    if (now.isBefore(prayerTime)) {
      return i;
    }
  }

  return 0; // بعد العشاء → الفجر
}

DateTime getNextPrayerTime(PrayerEntity prayer) {
  final index = getNextPrayerIndex(prayer);

  final prayerTimes = [
    prayer.fajr,
    prayer.dhuhr,
    prayer.asr,
    prayer.maghrib,
    prayer.isha,
  ];

  DateTime next = parsePrayerTime(prayerTimes[index]);
  final now = DateTime.now();

  if (index == 0 && now.isAfter(next)) {
    next = next.add(const Duration(days: 1));
  }

  return next;
}
