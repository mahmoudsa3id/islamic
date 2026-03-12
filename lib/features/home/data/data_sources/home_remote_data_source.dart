import 'package:islamic/core/service/api_service.dart';
import 'package:islamic/features/home/data/data_sources/home_local_data_source.dart';
import 'package:islamic/features/home/data/models/prayer_model/prayer_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<PrayerModel>> getMonthlyPrayers(
    double lat,
    double lon,
    int month,
    int year,
  );
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService apiService;

  HomeRemoteDatasourceImpl(this.apiService);

  @override
  Future<List<PrayerModel>> getMonthlyPrayers(
    double lat,
    double lon,
    int month,
    int year,
  ) async {
    /// نحاول نقرأ الكاش
    final cache = await PrayerCacheService.load(month, year);

    if (cache != null) {
      return cache.map((e) => PrayerModel.fromJson(e)).toList();
    }

    /// لو مفيش كاش نضرب API
    final response = await apiService.get(
      endpoint: "calendar",
      query: {
        "latitude": lat,
        "longitude": lon,
        "method": 5,
        "month": month,
        "year": year,
      },
    );

    final List data = response.data["data"];

    /// نحفظ الكاش
    await PrayerCacheService.save(data, month, year);

    return data.map((e) => PrayerModel.fromJson(e)).toList();
  }
}
