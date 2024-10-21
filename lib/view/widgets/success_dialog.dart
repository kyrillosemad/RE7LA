import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/constants/colors.dart';

successDialog(title, body) {
  Get.snackbar(title, body,
      backgroundColor: AppColor.primaryColor.withOpacity(0.5));
}
