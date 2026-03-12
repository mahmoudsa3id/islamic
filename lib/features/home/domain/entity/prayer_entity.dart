import 'package:islamic/features/home/data/models/prayer_model/hijri.dart';

class PrayerEntity {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final Hijri hijri;

  PrayerEntity({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.hijri,
  });
}
