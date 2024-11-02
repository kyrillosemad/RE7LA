import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/classes/status.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/data/seats/book_seat_req.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view/widgets/error_dialog.dart';

class BookingDetailsCubit extends Cubit<AppState> {
  BookingDetailsCubit() : super(Initial());
  var seatPrice = Get.arguments['seatPrice'];
  var totalPrice = Get.arguments['totalPrice'];
  var seats = Get.arguments['seats'];
  var seatsIds = Get.arguments['seatsIds'];
  payAndCompleteBooking(BuildContext context) async {
    //pay
    emit(Loading());
    Either<Status, Map> response = await bookSeatReq(seatsIds.toString());
    response.fold((l) {
      emit(GeneralError());
      errorDialog("There's Something Wrong , \n $l", context);
    }, (r) {
      if (r['status'] == "success") {
        emit(Success([]));
        Get.offAllNamed(AppRoutes().homePage);
        Get.snackbar(
            "Done", 'The reservation process was completed successfully',
            backgroundColor: AppColor.primaryColor.withOpacity(0.6),
            colorText: Colors.white);
      } else {
        emit(GeneralError());
        errorDialog("There's Something Wrong", context);
      }
    });
  }
}
