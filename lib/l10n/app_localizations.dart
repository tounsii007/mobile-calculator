import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [
    Locale('en'),
    Locale('de'),
    Locale('fr'),
  ];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Mobile Calculator',
      'calculatorTitle': 'Calculator',
      'historyTooltip': 'History',
      'scientificTooltip': 'Scientific',
      'settingsTooltip': 'Settings',
      'scientificCalculatorTitle': 'Scientific Calculator',
      'settingsTitle': 'Settings',
      'darkMode': 'Dark Mode',
      'calculationHistoryTitle': 'Calculation History',
      'noHistoryYet': 'No history yet',
      'historyWillAppear': 'Your calculations will appear here.',
    },
    'de': {
      'appTitle': 'Mobiler Rechner',
      'calculatorTitle': 'Rechner',
      'historyTooltip': 'Verlauf',
      'scientificTooltip': 'Wissenschaftlich',
      'settingsTooltip': 'Einstellungen',
      'scientificCalculatorTitle': 'Wissenschaftlicher Rechner',
      'settingsTitle': 'Einstellungen',
      'darkMode': 'Dunkelmodus',
      'calculationHistoryTitle': 'Rechenverlauf',
      'noHistoryYet': 'Noch kein Verlauf',
      'historyWillAppear': 'Deine Berechnungen erscheinen hier.',
    },
    'fr': {
      'appTitle': 'Calculatrice Mobile',
      'calculatorTitle': 'Calculatrice',
      'historyTooltip': 'Historique',
      'scientificTooltip': 'Scientifique',
      'settingsTooltip': 'Parametres',
      'scientificCalculatorTitle': 'Calculatrice Scientifique',
      'settingsTitle': 'Parametres',
      'darkMode': 'Mode sombre',
      'calculationHistoryTitle': 'Historique des calculs',
      'noHistoryYet': 'Pas encore d\'historique',
      'historyWillAppear': 'Vos calculs apparaitront ici.',
    },
  };

  String _value(String key) {
    final languageCode = _localizedValues.containsKey(locale.languageCode)
        ? locale.languageCode
        : 'en';
    return _localizedValues[languageCode]![key] ?? _localizedValues['en']![key]!;
  }

  String get appTitle => _value('appTitle');
  String get calculatorTitle => _value('calculatorTitle');
  String get historyTooltip => _value('historyTooltip');
  String get scientificTooltip => _value('scientificTooltip');
  String get settingsTooltip => _value('settingsTooltip');
  String get scientificCalculatorTitle => _value('scientificCalculatorTitle');
  String get settingsTitle => _value('settingsTitle');
  String get darkMode => _value('darkMode');
  String get calculationHistoryTitle => _value('calculationHistoryTitle');
  String get noHistoryYet => _value('noHistoryYet');
  String get historyWillAppear => _value('historyWillAppear');

  String historyItems(int count) {
    switch (locale.languageCode) {
      case 'de':
        return count == 1 ? '1 Eintrag' : '$count Eintraege';
      case 'fr':
        return count == 1 ? '1 element' : '$count elements';
      default:
        return count == 1 ? '1 item' : '$count items';
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'de', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future<AppLocalizations>.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
