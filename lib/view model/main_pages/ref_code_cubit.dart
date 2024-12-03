// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/booking_details_cubit.dart';
import '../../core/functions/paymob_payment/pay_with_refcode.dart';

class RefCodeCubit extends Cubit<AppState> {
  RefCodeCubit() : super(Initial());
  String response = Get.arguments['response'];

  checkPayment(BuildContext context) async {
    emit(Loading());
    try {
      var controller = Get.find<BookingDetailsCubit>();
      bool status = await PayWithRefCodeClass().checkPaymentStatus(response);
      if (status == true) {
        emit(Success([]));
        controller.completeBooking(context);
      } else {
        emit(Success([]));
        Get.snackbar("Failed", "Payment Not Completed , Try Again",
            backgroundColor: Colors.red.withOpacity(0.5),
            colorText: Colors.white);
        Get.offAllNamed(AppRoutes().homePage);
      }
    } catch (e) {
      emit(GeneralError());
      Get.snackbar("Failed", "There's Something Wrong",
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white);
      Get.offAllNamed(AppRoutes().homePage);
    }
  }
}
