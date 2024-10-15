import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class IntroCubit extends Cubit<AppState> {
  IntroCubit() : super(Initial());

  goToLogin() {
    Get.offAllNamed(AppRoutes().login);
  }

  goToSignUp() {
    Get.offAllNamed(AppRoutes().signUp);
  }

  login() {}
}
