// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get homeTitle {
    return Intl.message('Home', name: 'homeTitle', desc: '', args: []);
  }

  /// `Next Prayer`
  String get nextPrayer {
    return Intl.message('Next Prayer', name: 'nextPrayer', desc: '', args: []);
  }

  /// `Quran`
  String get quran {
    return Intl.message('Quran', name: 'quran', desc: '', args: []);
  }

  /// `Prayer`
  String get prayer {
    return Intl.message('Prayer', name: 'prayer', desc: '', args: []);
  }

  /// `Qibla`
  String get qibla {
    return Intl.message('Qibla', name: 'qibla', desc: '', args: []);
  }

  /// `Azkar`
  String get azkar {
    return Intl.message('Azkar', name: 'azkar', desc: '', args: []);
  }

  /// ` Hello  👋`
  String get greeting {
    return Intl.message(' Hello  👋', name: 'greeting', desc: '', args: []);
  }

  /// `Noor`
  String get appName {
    return Intl.message('Noor', name: 'appName', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Prayer Times`
  String get prayerTimes {
    return Intl.message(
      'Prayer Times',
      name: 'prayerTimes',
      desc: '',
      args: [],
    );
  }

  /// `Current Prayer`
  String get currentPrayer {
    return Intl.message(
      'Current Prayer',
      name: 'currentPrayer',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Time`
  String get remainingTime {
    return Intl.message(
      'Remaining Time',
      name: 'remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Finished`
  String get prayerFinished {
    return Intl.message(
      'Prayer Finished',
      name: 'prayerFinished',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message('Fajr', name: 'fajr', desc: '', args: []);
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message('Sunrise', name: 'sunrise', desc: '', args: []);
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message('Dhuhr', name: 'dhuhr', desc: '', args: []);
  }

  /// `Asr`
  String get asr {
    return Intl.message('Asr', name: 'asr', desc: '', args: []);
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message('Maghrib', name: 'maghrib', desc: '', args: []);
  }

  /// `Isha`
  String get isha {
    return Intl.message('Isha', name: 'isha', desc: '', args: []);
  }

  /// `Surah`
  String get surah {
    return Intl.message('Surah', name: 'surah', desc: '', args: []);
  }

  /// `Ayah`
  String get ayah {
    return Intl.message('Ayah', name: 'ayah', desc: '', args: []);
  }

  /// `Juz`
  String get juz {
    return Intl.message('Juz', name: 'juz', desc: '', args: []);
  }

  /// `Morning Azkar`
  String get morningAzkar {
    return Intl.message(
      'Morning Azkar',
      name: 'morningAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Evening Azkar`
  String get eveningAzkar {
    return Intl.message(
      'Evening Azkar',
      name: 'eveningAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Sleep Azkar`
  String get sleepAzkar {
    return Intl.message('Sleep Azkar', name: 'sleepAzkar', desc: '', args: []);
  }

  /// `Tasbeeh`
  String get tasbeeh {
    return Intl.message('Tasbeeh', name: 'tasbeeh', desc: '', args: []);
  }

  /// `Counter`
  String get counter {
    return Intl.message('Counter', name: 'counter', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Qibla Direction`
  String get direction {
    return Intl.message(
      'Qibla Direction',
      name: 'direction',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Hadith`
  String get hadith {
    return Intl.message('Hadith', name: 'hadith', desc: '', args: []);
  }

  /// `Calender`
  String get celender {
    return Intl.message('Calender', name: 'celender', desc: '', args: []);
  }

  /// `Mosques`
  String get mosques {
    return Intl.message('Mosques', name: 'mosques', desc: '', args: []);
  }

  /// `zakat`
  String get zakat {
    return Intl.message('zakat', name: 'zakat', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Notifications`
  String get prayerNotifications {
    return Intl.message(
      'Prayer Notifications',
      name: 'prayerNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Loading`
  String get loading {
    return Intl.message('Loading', name: 'loading', desc: '', args: []);
  }

  /// `Something went wrong`
  String get error {
    return Intl.message(
      'Something went wrong',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Read More`
  String get readMore {
    return Intl.message('Read More', name: 'readMore', desc: '', args: []);
  }

  /// `Hadith Details`
  String get hadithDetails {
    return Intl.message(
      'Hadith Details',
      name: 'hadithDetails',
      desc: '',
      args: [],
    );
  }

  /// `Day Hadiths`
  String get dayHadiths {
    return Intl.message('Day Hadiths', name: 'dayHadiths', desc: '', args: []);
  }

  /// `Hadiths`
  String get hadiths {
    return Intl.message('Hadiths', name: 'hadiths', desc: '', args: []);
  }

  /// `Hadiths List`
  String get hadithsList {
    return Intl.message(
      'Hadiths List',
      name: 'hadithsList',
      desc: '',
      args: [],
    );
  }

  /// `Mosques List`
  String get mosquesList {
    return Intl.message(
      'Mosques List',
      name: 'mosquesList',
      desc: '',
      args: [],
    );
  }

  /// `Ayah of the Day`
  String get ayahDay {
    return Intl.message('Ayah of the Day', name: 'ayahDay', desc: '', args: []);
  }

  /// `Library`
  String get library {
    return Intl.message('Library', name: 'library', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
