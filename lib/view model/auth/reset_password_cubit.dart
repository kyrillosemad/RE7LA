import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/auth/forget_password/reset_password_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view/widgets/error_dialog.dart';
import 'package:re7la/view/widgets/success_dialog.dart';

class ResetPasswordCubit extends Cubit<AppState> {
  ResetPasswordCubit() : super(Initial());
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  var email = Get.arguments['email'];
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isSecured = true;
  bool newPasswordIsSecured = true;
  newPasswordChangeSecured() {
    newPasswordIsSecured = !newPasswordIsSecured;
    emit(Initial());
  }
  changeSecured() {
    isSecured = !isSecured;
    emit(Initial());
  }

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
  }

  resetPassword(BuildContext context) async {
    if (password.text == newPassword.text) {
      emit(Loading());
      Either<Status, Map> response = await resetPasswordReq(email, password);
      response.fold((l) {
        emit(GeneralError());
        errorDialog("There's Something Wrong , Please Try Again", context);
      }, (r) {
        if (r['status'] == 'success') {
          emit(Success([]));
          Get.offAllNamed(AppRoutes().login);
          successDialog("Done !", 'The Password Is Changed Successfully');
        } else {
          emit(GeneralError());
          errorDialog("There's Something Wrong , Please Try Again", context);
        }
      });
    } else {
      errorDialog("The Password Is Not The Same", context);
    }
  }
}
