import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view%20model/main_pages/booking_details_cubit.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                            Column(children: [
                              Text('Coach',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                            Column(children: [
                              Text('Price',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                          ],
                        ),
                        ...controller.seats.map((seat) {
                          return TableRow(
                            children: [
                              Column(children: [
                                Text('Seat: ${seat['seatNumber'].toString()}',
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
                    const SizedBox(height: 8),
                    Text(
                      "${controller.totalPrice.toStringAsFixed(2)} EGP",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print(controller.seatsIds);
                          controller.payAndCompleteBooking(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text(
                          "Pay Now",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
