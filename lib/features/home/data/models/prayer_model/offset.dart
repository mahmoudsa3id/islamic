class Offset {
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
    imsak: (json['Imsak'] as num?)?.toInt(),
    fajr: (json['Fajr'] as num?)?.toInt(),
    sunrise: (json['Sunrise'] as num?)?.toInt(),
    dhuhr: (json['Dhuhr'] as num?)?.toInt(),
    asr: (json['Asr'] as num?)?.toInt(),
    maghrib: (json['Maghrib'] as num?)?.toInt(),
    sunset: (json['Sunset'] as num?)?.toInt(),
    isha: (json['Isha'] as num?)?.toInt(),
    midnight: (json['Midnight'] as num?)?.toInt(),
  );

  Map<String, dynamic> toJson() => {
    'Imsak': imsak,
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Maghrib': maghrib,
    'Sunset': sunset,
    'Isha': isha,
    'Midnight': midnight,
  };
}
