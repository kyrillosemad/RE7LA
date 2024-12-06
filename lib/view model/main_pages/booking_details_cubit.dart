// ignore_for_file: use_build_context_synchronously
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/core/functions/local_notification/local_notification.dart';
import 'package:re7la/core/functions/paymob_payment/pay_with_refcode.dart';
import 'package:re7la/core/functions/paymob_payment/pay_with_card.dart';
import 'package:re7la/core/functions/paymob_payment/pay_with_wallet.dart';
import 'package:re7la/core/functions/paypal_payment/pay_with_paypal.dart';
import 'package:re7la/data/seats/book_seat_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view/widgets/error_dialog.dart';

class BookingDetailsCubit extends Cubit<AppState> {
  BookingDetailsCubit() : super(Initial());
  TextEditingController walletNumber = TextEditingController();
  var seatPrice = Get.arguments['seatPrice'];
  var totalPrice = Get.arguments['totalPrice'];
  var seats = Get.arguments['seats'];
  var seatsIds = Get.arguments['seatsIds'];
  var travelId = Get.arguments['travelId'];
  var travelFrom = Get.arguments['travelFrom'];
  var travelTo = Get.arguments['travelTo'];
  var travelDate = Get.arguments['travelDate'];
  String response = "";

  completeBooking(BuildContext context) async {
    emit(Loading());
    Either<Status, Map> response = await bookSeatReq(
        seatsIds.toString(),
        travelId.toString(),
        travelFrom.toString(),
        travelTo.toString(),
        travelDate);
    response.fold((l) {
      emit(GeneralError());
      errorDialog("There's Something Wrong , \n $l", context);
    }, (r) {
      if (r['status'] == "success") {
        emit(Success([]));
        Get.offAllNamed(AppRoutes().successReservation);
        Get.snackbar(
            "Done", 'The reservation process was completed successfully',
            backgroundColor: Colors.green.withOpacity(0.6),
            colorText: Colors.white);

        // حساب الوقت قبل 6 ساعات من موعد الرحلة
        DateTime notificationTime =
            DateTime.parse(travelDate).subtract(const Duration(hours: 6));
        // إرسال إشعار قبل 6 ساعات
        LocalNotificationService.showScheduledNotification(
          title: 'Reminder',
          body: 'Your trip is in 6 hours, get ready!',
          scheduledTime: notificationTime,
        );
      } else {
        emit(GeneralError());
        errorDialog("There's Something Wrong", context);
      }
    });
  }

  setInitialState() {
    emit(Initial());
  }

  payWithCard(BuildContext context, double amount) async {
    emit(Loading());
    try {
      paymobPayWithCard(
        context,
        amount,
        this,
      );
    } catch (e) {
      Get.snackbar("Failed", "There's Something Wrong",
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white);
    }
  }

  payWithWallet(
      BuildContext context, double amount, String walletNumber) async {
    emit(Loading());
    try {
      Get.back();
      paymobPayWithWallet(context, amount, walletNumber, this);
    } catch (e) {
      Get.snackbar("Failed", "There's Something Wrong",
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white);
    }
  }

  payWithPaypalFun(BuildContext context) {
    emit(Loading());
    payWithPaypal(context, this, totalPrice.toString());
  }

  payWithRefCodeFun(int amount) async {
    emit(Loading());
    response = await PayWithRefCodeClass().payWithRefCode(amount);
    if (response.isNotEmpty) {
      emit(Success([]));
      Get.put(BookingDetailsCubit());
      Get.offAllNamed(AppRoutes().refCode,
          arguments: {"controller": this, "response": response});
    } else {
      emit(GeneralError());
    }
  }
}
