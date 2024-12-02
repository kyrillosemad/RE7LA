import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:get/get.dart';
import 'package:re7la/view%20model/main_pages/booking_details_cubit.dart';

paymobPayWithCard(
    BuildContext context, double amount, BookingDetailsCubit controller) {
  try {
    FlutterPaymob.instance.payWithCard(
      context: context,
      currency: "EGP",
      amount: amount,
      onPayment: (response) {
        if (response.responseCode ==
            'APPROVED' /* && response.success == true  في حالة الحساب الحقيقي*/) {
          controller.completeBooking(context);
        } else if (response.responseCode == 'CANCELLED') {
          Get.snackbar(
            "Payment Cancelled",
            "You have cancelled the payment.",
            backgroundColor: Colors.orange.withOpacity(0.6),
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Payment Failed",
            response.message ?? "Payment failed. Please try again.",
            backgroundColor: Colors.red.withOpacity(0.6),
            colorText: Colors.white,
          );
        }
      },
    );
  } catch (e) {
    Get.snackbar(
      "Error",
      "An unexpected error occurred. Please try again later.",
      backgroundColor: Colors.red.withOpacity(0.6),
      colorText: Colors.white,
    );
  }
}