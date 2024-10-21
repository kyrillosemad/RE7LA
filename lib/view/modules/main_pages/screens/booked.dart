import 'package:flutter/material.dart';
import 'package:re7la/view/modules/main_pages/widgets/booked_appbar.dart';
import 'package:re7la/view/modules/main_pages/widgets/booked_travel_card.dart';
import 'package:sizer/sizer.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: 100.w,
      height: 100.h,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          const BookedAppbar(),
          const BookedTravelCard(),
        ],
      ),
    )));
  }
}
