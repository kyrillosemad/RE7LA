import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';

class SuccessReservationCubit extends Cubit<AppState> {
  SuccessReservationCubit() : super(Initial());

  goToHomePage() {
    Get.offAllNamed(AppRoutes().homePage);
  }
}
