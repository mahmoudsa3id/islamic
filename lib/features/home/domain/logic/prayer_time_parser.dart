DateTime parsePrayerTime(String time) {
  final now = DateTime.now();

  final cleanTime = time.split(" ").first;

  final parts = cleanTime.split(":");

  return DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
  );
}
