import 'package:get/get.dart';
import 'package:inkubox_app/app/utils/localization/en_us.dart';
import 'package:inkubox_app/app/utils/localization/fr_FR.dart';
import 'package:inkubox_app/app/utils/localization/lt_LT.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'lt_LT': ltLT,
        'fr_FR': frFR,
      };
}
