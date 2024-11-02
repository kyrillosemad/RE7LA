import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view%20model/main_pages/travel_details_cubit.dart';
import 'package:sizer/sizer.dart';

class TravelDetailsConfirmButton extends StatelessWidget {
  final TravelDetailsCubit controller;
  const TravelDetailsConfirmButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToBookingDetails();
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          width: 80.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Center(
            child: Text(
              "Confirm Booking",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ),
        ),
      ),
    );
  }
}
