import 'package:bloc/bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class ForgetPasswordEmailVerificationCubit extends Cubit<AppState> {
  ForgetPasswordEmailVerificationCubit() : super(Initial());

  goToResetPassword() {
    Get.toNamed(AppRoutes().resetPassword);
  }

  checkCode() {}
}
