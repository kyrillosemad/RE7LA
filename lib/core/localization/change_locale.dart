import 'dart:ui';
import 'package:get/get.dart';
import 'package:re7la/core/services/services.dart';

class LocaleClass extends GetxController {
  final Services services = Get.put(Services());
  String curLang = "EN";
  void changeLocale(String langCode) {
    Get.updateLocale(Locale(langCode));
    update();
  }
}
