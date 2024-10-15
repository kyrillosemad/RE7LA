import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class LoginCubit extends Cubit<AppState> {
  LoginCubit() : super(Initial());
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isSecure = true;

  goToSignUp() {
    Get.offAllNamed(AppRoutes().signUp);
  }

  changeSecure() {
    isSecure = !isSecure;
    emit(Initial());
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes().forgetPassword);
  }

  login() {}
}
