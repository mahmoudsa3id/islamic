import 'package:islamic/features/home/domain/entity/prayer_entity.dart';

class NextPrayerResult {
  final PrayerEntity prayer;
  final int nextIndex;
  final String city;
  final String address;
  final DateTime nextPrayerTime;

  NextPrayerResult({
    required this.prayer,
    required this.nextIndex,
    required this.city,
    required this.address,
    required this.nextPrayerTime,
  });
}
