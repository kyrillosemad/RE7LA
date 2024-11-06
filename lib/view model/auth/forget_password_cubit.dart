import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class ForgetPasswordCubit extends Cubit<AppState> {
  ForgetPasswordCubit() : super(Initial());
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  goToVerificationCode() {
    if (key.currentState!.validate()) {
      return Get.toNamed(AppRoutes().forgetPasswordEmailVerification,arguments: {'email':email.text});
    }
  }

  sendCode() {}
}
