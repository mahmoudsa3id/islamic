import 'package:islamic/features/home/data/models/prayer_model/data.dart';
import 'package:islamic/features/home/data/models/prayer_model/hijri.dart';
import 'package:islamic/features/home/domain/entity/prayer_entity.dart';

class PrayerModel extends PrayerEntity {
  final int? code;
  final String? status;
  final Data? data;

  PrayerModel({
    this.code,
    this.status,
    this.data,
  }) : super(
          fajr: data?.timings?.fajr ?? '',
          dhuhr: data?.timings?.dhuhr ?? '',
          asr: data?.timings?.asr ?? '',
          maghrib: data?.timings?.maghrib ?? '',
          isha: data?.timings?.isha ?? '',
         hijri: data?.date?.hijri ?? Hijri(),
        );

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] != null
        ? Data.fromJson(json['data'])
        : null;

    return PrayerModel(
      code: json['code'],
      status: json['status'],
      data: data,
    );
  }
}