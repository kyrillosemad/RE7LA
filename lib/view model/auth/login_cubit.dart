import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/core/services/services.dart';
import 'package:re7la/data/auth/login_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view/widgets/error_dialog.dart';
import 'package:re7la/view/widgets/success_dialog.dart';

class LoginCubit extends Cubit<AppState> {
  LoginCubit() : super(Initial());
  Services services = Get.find<Services>();
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

  login(BuildContext context) async {
    emit(Loading());
    Either<Status, Map> response = await loginReq(email.text, password.text);
    response.fold((l) {
      emit(GeneralError());
      errorDialog("There's Something Wrong , \n $l", context);
    }, (r) {
      if (r['status'] == "success") {
        if (services.sharedPref != null) {
          emit(Success(r['data']));
          services.sharedPref!
              .setString("userId", r['data']['user_id'].toString());
          services.sharedPref!
              .setString("userName", r['data']['user_name'].toString());
          services.sharedPref!
              .setString("userEmail", r['data']['user_email'].toString());
          services.sharedPref!
              .setString("userPhone", r['data']['user_phone'].toString());
          Get.offAllNamed(AppRoutes().homePage);
          successDialog("Done", "You Have Successfully Signed In");
        } else {
          emit(GeneralError());
        }
      } else {
        emit(GeneralError());
        errorDialog("Email or Password Is Not Correct !", context);
      }
    });
  }
}
