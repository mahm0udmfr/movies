import 'package:flutter_bloc/flutter_bloc.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  String currentLocale = "en";

  LanguageCubit() : super(LanguageUpdated("en"));

  void changeLanguage(String newLocale) {
    if (newLocale == currentLocale) {
      return;
    }
    currentLocale = newLocale;
    emit(LanguageUpdated(currentLocale));
  }
}
