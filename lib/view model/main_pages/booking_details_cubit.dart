// ignore_for_file: use_build_context_synchronously
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/core/functions/paymob_with_package/pay_with_card.dart';
import 'package:re7la/core/functions/paymob_with_package/pay_with_wallet.dart';
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
        Get.offAllNamed(AppRoutes().homePage);
        Get.snackbar(
            "Done", 'The reservation process was completed successfully',
            backgroundColor: Colors.green.withOpacity(0.6),
            colorText: Colors.white);
      } else {
        emit(GeneralError());
        errorDialog("There's Something Wrong", context);
      }
    });
  }

  payWithCard(BuildContext context, double amount) async {
    paymobPayWithCard(
      context,
      amount,
      this,
    );
  }

  payWithWallet(
      BuildContext context, double amount, String walletNumber) async {
    paymobPayWithWallet(context, amount, walletNumber, this);
  }
}
