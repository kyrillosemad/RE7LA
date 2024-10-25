import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/services/services.dart';
import 'package:re7la/view%20model/app_states.dart';

class AccountCubit extends Cubit<AppState> {
  AccountCubit() : super(Initial());
  Services services = Get.find<Services>();
  var userId = Get.find<Services>().sharedPref!.getString("userId");
  var userName = Get.find<Services>().sharedPref!.getString("userName");
  var userEmail = Get.find<Services>().sharedPref!.getString("userEmail");
  var userPhone = Get.find<Services>().sharedPref!.getString("userPhone");
}
