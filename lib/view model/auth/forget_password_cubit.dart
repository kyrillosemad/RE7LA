import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/auth/forget_password/check_email_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:dartz/dartz.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/view/widgets/error_dialog.dart';

class ForgetPasswordCubit extends Cubit<AppState> {
  ForgetPasswordCubit() : super(Initial());
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  sendCode(BuildContext context) async {
    emit(Loading());
    Either<Status, Map> response = await chechEmailReq(email.text);
    response.fold((l) {
      emit(GeneralError());
      errorDialog("There's Something Wrong !, \n $l", context);
    }, (r) {
      if (r['status'] == 'success') {
        emit(Success([]));
        Get.toNamed(AppRoutes().forgetPasswordEmailVerification,
            arguments: {'email': email.text});
      } else {
        emit(GeneralError());
        errorDialog("There's Something Wrong !", context);
      }
    });
  }
}
