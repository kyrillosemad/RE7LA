// import 'package:flutter/material.dart';
// import 'package:re7la/core/functions/paymob_payment/paymob_manager.dart';

// Future paymobPayWithCard(BuildContext context, int amount) async {
//   try {
//     PaymobManager paymobManager = PaymobManager();
//     String paymentKey = await paymobManager.getPaymentKey(amount, "EGP");
//     final paymentUrl = Uri.parse(
//         "https://accept.paymob.com/api/acceptance/iframes/866157?payment_token=$paymentKey");
//     return paymentUrl;
//   } catch (error) {
//     throw Exception(error);
//   }
// }
