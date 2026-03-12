import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:islamic/core/service/api_service.dart';
import 'package:islamic/core/service/location_service.dart';
import 'package:islamic/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:islamic/features/home/data/repo/home_repo_impl.dart';
import 'package:islamic/features/home/domain/repo/home_repo.dart';
import 'package:islamic/features/home/domain/useCases/next_prayer_use_case.dart';
import 'package:islamic/features/home/presentation/cubit/cubit/next_prayer_cubit.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  /// Hive init

  /// Dio
  getit.registerLazySingleton(() => Dio());

  /// Services
  getit.registerLazySingleton(() => LocationService());

  /// Api Service
  getit.registerLazySingleton(() => ApiService(getit<Dio>()));

  /// Datasources
  getit.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(getit<ApiService>()),
  );

  /// Repository
  getit.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getit<HomeRemoteDatasource>()),
  );

  /// UseCase
  getit.registerLazySingleton(
    () => NextPrayerUseCase(getit<HomeRepo>(), getit<LocationService>()),
  );

  /// Cubit
  getit.registerFactory(() => NextPrayerCubit(getit<NextPrayerUseCase>()));
}
