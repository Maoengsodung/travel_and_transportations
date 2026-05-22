import 'dart:ui';

import 'package:get/get.dart';

class LanguagesController extends GetxController {
  // Selected language
  var selectedLanguage = 'English'.obs;
  RxString selectedFlag = '🇺🇸'.obs;

  final List<Map<String, String>> languages = [
    {'name': 'English', 'flag': '🇺🇸', 'code': 'en', 'country': 'US'},
    {'name': 'Khmer', 'flag': '🇰🇭', 'code': 'km', 'country': 'KH'},
    {'name': 'Chinese', 'flag': '🇨🇳', 'code': 'zh', 'country': 'CN'},
    {'name': 'Vietnamese', 'flag': '🇻🇳', 'code': 'vi', 'country': 'VN'},
    {'name': 'Korean', 'flag': '🇰🇷', 'code': 'ko', 'country': 'KR'},
    {'name': 'Japanese', 'flag': '🇯🇵', 'code': 'ja', 'country': 'JP'},
    {'name': 'Malay', 'flag': '🇲🇾', 'code': 'ms', 'country': 'MY'},
  ];

  // Temp Selected
  RxString tempLanguage = 'English'.obs;
  RxString tempFlag = '🇺🇸'.obs;

  // Select Language
  void selectLanguage({required String language, required String flag}) {
    tempLanguage.value = language;
    tempFlag.value = flag;
  }

  // Continue Button
  void saveLanguage({
    required String languageCode,
    required String countryCode,
  }) {
    selectedLanguage.value = tempLanguage.value;
    selectedFlag.value = tempFlag.value;

    Get.updateLocale(Locale(languageCode, countryCode));

    Get.back();
  }

  // change language
  void changeLanguage(String lang) {
    if (lang == 'kh') {
      Get.updateLocale(Locale('km', 'KH'));
    } else if (lang == 'en') {
      Get.updateLocale(Locale('en', 'US'));
    }
  }
}
