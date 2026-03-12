DateTime parsePrayerTime(String time) {
  final now = DateTime.now();

  final parts = time.split(":");

  return DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );
}
