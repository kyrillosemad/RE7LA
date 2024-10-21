import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/auth/signup_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view/widgets/error_dialog.dart';

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

  signUpFun(BuildContext context) async {
    emit(Loading());
    if (formKey.currentState!.validate()) {
      Either<Status, Map> response =
          await signUpReq(userName.text, email.text, password.text, phone.text);
      response.fold((l) {
        emit(GeneralError());
        errorDialog("There's Something Wrong , \n $l", context);
      }, (r) {
        if (r['status'] == "success") {
          emit(Success([]));
          Get.toNamed(AppRoutes().signUpEmailVerification, arguments: {
            "email": email.text,
          });
          userName.clear();
          email.clear();
          password.clear();
          phone.clear();
        } else {
          emit(GeneralError());
          errorDialog("Wrong Email or Password \n Please Try Again", context);
        }
      });
    }
  }
}
