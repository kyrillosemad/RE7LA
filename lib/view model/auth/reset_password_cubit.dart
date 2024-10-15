import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class ResetPasswordCubit extends Cubit<AppState> {
  ResetPasswordCubit() : super(Initial());
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isSecured = true;

  changeSecured() {
    isSecured = !isSecured;
    emit(Initial());
  }

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
  }

  resetPassword() {}
}
