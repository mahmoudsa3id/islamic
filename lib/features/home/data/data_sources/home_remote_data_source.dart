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

  const HomeRemoteDatasourceImpl(this.apiService);

  @override
  Future<List<PrayerModel>> getMonthlyPrayers(
    double lat,
    double lon,
    int month,
    int year,
  ) async {
    try {
      /// 1️⃣ محاولة قراءة الكاش
      final cache = await PrayerCacheService.load(month, year);

      if (cache != null && cache.isNotEmpty) {
        return cache.map<PrayerModel>((e) => PrayerModel.fromJson(e)).toList();
      }

      /// 2️⃣ ضرب API
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

      final List<dynamic> data = response.data["data"];

      /// 3️⃣ حفظ الكاش
      await PrayerCacheService.save(data, month, year);

      /// 4️⃣ تحويل البيانات
      return data.map<PrayerModel>((e) => PrayerModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to fetch prayer times: $e");
    }
  }
}
