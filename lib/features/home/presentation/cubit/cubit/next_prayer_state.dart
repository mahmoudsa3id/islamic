part of 'next_prayer_cubit.dart';

@immutable
sealed class NextPrayerState {}

final class NextPrayerInitial extends NextPrayerState {}

class NextPrayerLoading extends NextPrayerState {}

class NextPrayerLoaded extends NextPrayerState {
  final PrayerEntity prayer;
  final int nextIndex;
  final String city;
  final String address;

  NextPrayerLoaded(this.prayer, this.nextIndex, this.city, this.address);
}

class NextPrayerError extends NextPrayerState {
  final String message;

  NextPrayerError(this.message);
}
