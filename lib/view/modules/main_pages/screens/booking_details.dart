import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/images.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/booking_details_cubit.dart';
import 'package:re7la/view/modules/main_pages/widgets/payment_method.dart';
import 'package:re7la/view/modules/main_pages/widgets/wallet_number_dialog.dart';
import 'package:sizer/sizer.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Booking Details"),
          backgroundColor: AppColor.primaryColor,
        ),
        body: BlocProvider(
          create: (context) => BookingDetailsCubit(),
          child: Builder(
            builder: (context) {
              var controller = context.read<BookingDetailsCubit>();
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Reserved Seats:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 8),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            const TableRow(
                              children: [
                                Column(children: [
                                  Text('Seat Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: [
                                  Text('Coach',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                                Column(children: [
                                  Text('Price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                              ],
                            ),
                            ...controller.seats.map((seat) {
                              return TableRow(
                                children: [
                                  Column(children: [
                                    Text(
                                        'Seat: ${seat['seatNumber'].toString()}',
                                        style: const TextStyle(fontSize: 16))
                                  ]),
                                  Column(children: [
                                    Text('Coach: ${seat['coachId'].toString()}',
                                        style: const TextStyle(fontSize: 16)),
                                  ]),
                                  Column(children: [
                                    Text('${controller.seatPrice} EGP',
                                        style: const TextStyle(fontSize: 16)),
                                  ]),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Total Price:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${controller.totalPrice.toStringAsFixed(2)} EGP",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<BookingDetailsCubit, AppState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Image(
                                    image: AssetImage(AppImages().payment),
                                    height: 30.h,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Payment Method:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  ),
                                  const SizedBox(height: 5),
                                  PaymentMethod(
                                    function: () {
                                      controller.payWithCard(context,
                                          controller.totalPrice.toDouble());
                                    },
                                    name: "Master Card",
                                    widget: Image(
                                        image:
                                            AssetImage(AppImages().masterCard)),
                                  ),
                                  PaymentMethod(
                                    function: () {
                                      walletDialog(controller, context);
                                    },
                                    name: "Mobile Wallets",
                                    widget: Image(
                                        image:
                                            AssetImage(AppImages().mobWallet)),
                                  ),
                                  PaymentMethod(
                                    function: () {
                                      controller.payWithRefCodeFun(100);
                                    },
                                    name: "Ref Code",
                                    widget: Image(
                                        image: AssetImage(AppImages().refCode)),
                                  ),
                                ],
                              );
                            }
                          },
                        )
                      ]),
                ),
              );
            },
          ),
        ));
  }
}
