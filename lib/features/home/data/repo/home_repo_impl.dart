import 'package:dartz/dartz.dart';
import 'package:islamic/core/errors/failure.dart';
import 'package:islamic/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:islamic/features/home/domain/entity/prayer_entity.dart';
import 'package:islamic/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource remote;

  HomeRepoImpl(this.remote);

  @override
  Future<Either<Failure, List<PrayerEntity>>> getPrayerTimes(
    double latitude,
    double longitude,
    int month,
    int year,
  ) async {
    try {
      final remoteData = await remote.getMonthlyPrayers(
        latitude,
        longitude,
        month,
        year,
      );

      return Right(remoteData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
