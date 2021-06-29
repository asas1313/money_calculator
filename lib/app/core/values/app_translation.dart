import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': Locales.en_US,
        'lt_LT': Locales.lt_LT,
      };
}

class LocaleKeys {
  LocaleKeys._();
  static const app_name = 'app_name';
  static const app_description = 'app_description';
  static const app_choose_language = 'app_choose_language';
  static const app_language = 'app_language';
  static const lang_lithuanian = 'lang_lithuanian';
  static const lang_english = 'lang_english';
  static const home_view_app_bar = 'home_view_app_bar';
  static const home_view_middle_text = 'home_view_middle_text';
}

class Locales {
  static const en_US = {
    'app_name': 'Money Calculator',
    'app_description': 'Money calculator application for any household.',
    'app_choose_language': 'Choose language',
    'app_language': 'Language',
    'lang_lithuanian': 'Lithuanian',
    'lang_english': 'English',
    'home_view_app_bar': 'Home view',
    'home_view_middle_text': 'Home view' 's page',
  };
  static const lt_LT = {
    'app_name': 'Pinigų skaičiuotuvas',
    'app_description':
        'Pinigų skaičiutuvas tai programėlė bet kuriam namų ūkiui.',
    'app_choose_language': 'Pasirinkite kalbą',
    'app_language': 'Kalba',
    'lang_lithuanian': 'Lietuvių',
    'lang_english': 'Anglų',
    'home_view_app_bar': 'Namų puslapis',
    'home_view_middle_text': 'Namų puslapio vaizdas',
  };
}
