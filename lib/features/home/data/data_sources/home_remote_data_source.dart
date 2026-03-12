import 'package:islamic/core/service/api_service.dart';
import 'package:islamic/features/home/data/models/prayer_model/prayer_model.dart';

abstract class HomeRemoteDatasource {
  Future<PrayerModel> getMonthlyPrayers(double lat, double lon);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService apiService;

  HomeRemoteDatasourceImpl(this.apiService);

  @override
  Future<PrayerModel> getMonthlyPrayers(double lat, double lon) async {
    final response = await apiService.get(
      endpoint: "timings",
      query: {"latitude": lat, "longitude": lon, "method": 5},
    );

    return PrayerModel.fromJson(response.data);
  }
}
