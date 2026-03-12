import 'package:bloc/bloc.dart';
import 'package:islamic/features/home/domain/entity/prayer_entity.dart';
import 'package:islamic/features/home/domain/useCases/next_prayer_use_case.dart';
import 'package:meta/meta.dart';

part 'next_prayer_state.dart';

class NextPrayerCubit extends Cubit<NextPrayerState> {
  final NextPrayerUseCase usecase;

  NextPrayerCubit(this.usecase) : super(NextPrayerInitial());

  Future<void> loadPrayer(String locale) async {
    emit(NextPrayerLoading());

    final result = await usecase("ar");

    result.fold(
      (failure) => emit(NextPrayerError(failure.errMessage)),
      (data) => emit(
        NextPrayerLoaded(data.prayer, data.nextIndex, data.city, data.address),
      ),
    );
  }
}
