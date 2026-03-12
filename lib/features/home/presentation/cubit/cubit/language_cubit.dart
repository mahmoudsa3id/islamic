import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('ar'));

  void changeLanguage() {
    if (state.languageCode == 'ar') {
      emit(const Locale('en'));
    } else {
      emit(const Locale('ar'));
    }
  }
}
