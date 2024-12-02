import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view%20model/main_pages/booking_details_cubit.dart';

walletDialog(BookingDetailsCubit controller, BuildContext context) {
  Get.defaultDialog(
    title: "Wallet Number",
    titleStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    radius: 15,
    content: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller.walletNumber,
        decoration: InputDecoration(
          labelText: "Enter Wallet Number",
          labelStyle: const TextStyle(color: AppColor.primaryColor),
          prefixIcon: const Icon(Icons.wallet, color: AppColor.primaryColor),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          filled: true,
          fillColor: Colors.blue[50],
        ),
        keyboardType: TextInputType.number,
      ),
    ),
    textConfirm: "Confirm",
    confirmTextColor: Colors.white,
    buttonColor: AppColor.primaryColor,
    onConfirm: () {
      controller.payWithWallet(context, controller.totalPrice.toDouble(),
          controller.walletNumber.text.toString());
    },
    textCancel: "Cancel",
    cancelTextColor: AppColor.primaryColor,
  );
}
