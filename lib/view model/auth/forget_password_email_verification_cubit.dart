import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/auth/verifycode_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view/widgets/error_dialog.dart';

class ForgetPasswordEmailVerificationCubit extends Cubit<AppState> {
  ForgetPasswordEmailVerificationCubit() : super(Initial());
  var email = Get.arguments['email'];

  checkCode(verifycode, BuildContext context) async {
    emit(Loading());
    Either<Status, Map> response = await verifyCodeReq(email, verifycode);
    response.fold((l) {
      emit(GeneralError());
      errorDialog("There's Something Wrong , \n $l", context);
    }, (r) {
      if (r['status'] == "success") {
        emit(Success([]));
        Get.toNamed(AppRoutes().resetPassword);
      } else {
        emit(GeneralError());
        errorDialog("The Verification Code Is Wrong", context);
      }
    });
  }
}
