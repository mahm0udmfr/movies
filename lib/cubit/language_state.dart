

abstract class LanguageState {}

class LanguageUpdated extends LanguageState {
  String locale;

  LanguageUpdated(this.locale);
}
