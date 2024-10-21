import 'package:flutter/material.dart';
import 'package:re7la/view/modules/main_pages/widgets/bus_booking_appbar.dart';
import 'package:re7la/view/modules/main_pages/widgets/bus_booking_bus_seats.dart';
import 'package:re7la/view/modules/main_pages/widgets/bus_booking_confirm_button.dart';
import 'package:re7la/view/modules/main_pages/widgets/bus_booking_custom_row.dart';
import 'package:sizer/sizer.dart';

class BusBooking extends StatefulWidget {
  const BusBooking({super.key});

  @override
  State<BusBooking> createState() => _BusBookingState();
}

class _BusBookingState extends State<BusBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BusBookingAppbar(),
            SizedBox(height: 2.h),
            const BusBookingCustomRow(),
            SizedBox(height: 2.h),
            const BusBookingBusSeats(),
            const BusBookingConfirmButton(),
          ],
        ),
      ),
    );
  }
}
