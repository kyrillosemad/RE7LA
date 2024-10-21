import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class BusBookingCustomRow extends StatelessWidget {
  const BusBookingCustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.event_seat, color: Colors.grey),
              SizedBox(width: 1.w),
              Text("Available",
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp)),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.event_seat, color: Colors.red),
              SizedBox(width: 1.w),
              Text("Booked",
                  style: TextStyle(color: Colors.red, fontSize: 10.sp)),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.event_seat, color: AppColor.primaryColor),
              SizedBox(width: 1.w),
              Text("Selected",
                  style:
                      TextStyle(color: AppColor.primaryColor, fontSize: 10.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
