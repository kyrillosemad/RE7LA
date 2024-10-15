import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class SignUpCubit extends Cubit<AppState> {
  SignUpCubit() : super(Initial());
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isSecure = true;

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
  }

  changeSecure() {
    isSecure = !isSecure;
    emit(Initial());
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes().forgetPassword);
  }
}
