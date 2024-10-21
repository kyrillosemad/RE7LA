import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors.dart';

class BusBookingAppbar extends StatelessWidget {
  const BusBookingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.sp),
          bottomRight: Radius.circular(25.sp),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22.sp,
                    )),
              ),
              Text(
                "ID :55484855",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              SizedBox(width: 2.w),
              Text("From: Qena",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp)),
              SizedBox(width: 10.w),
              const Icon(Icons.send, color: Colors.white),
              SizedBox(width: 2.w),
              Text("To: Cairo",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Date: 15/5/2024",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp)),
              SizedBox(width: 5.w),
              Text("Time: 10 pm",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            ],
          ),
          SizedBox(height: 2.h),
          Text("Price: 250 EGP",
              style: TextStyle(color: Colors.white, fontSize: 12.sp)),
        ],
      ),
    );
  }
}
