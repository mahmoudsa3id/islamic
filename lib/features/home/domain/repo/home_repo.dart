import 'package:dartz/dartz.dart';
import 'package:islamic/core/errors/failure.dart';
import 'package:islamic/features/home/domain/entity/prayer_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PrayerEntity>>> getPrayerTimes(
    double latitude,
    double longitude,
    int month,
    int year,
  );
}
