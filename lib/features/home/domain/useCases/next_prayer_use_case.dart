import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/service/location_service.dart';
import '../entity/next_prayer.dart';
import '../logic/prayer_logic.dart';
import '../repo/home_repo.dart';

class NextPrayerUseCase {
  final HomeRepo repo;
  final LocationService locationService;

  NextPrayerUseCase(this.repo, this.locationService);

  Future<Either<Failure, NextPrayerResult>> call(String locale) async {
    final location = await locationService.getLocationData(locale: locale);

    final result = await repo.getPrayerTimes(location.lat, location.lon);

    return result.map((prayers) {
      final nextIndex = getNextPrayerIndex(prayers);
      final nextTime = getNextPrayerTime(prayers);

      return NextPrayerResult(
        prayer: prayers,
        nextIndex: nextIndex,
        city: location.city,
        address: location.address,
        nextPrayerTime: nextTime,
      );
    });
  }
}
