import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/main_pages/travel_details_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/colors.dart';

class TravelDetailsAppbar extends StatelessWidget {
  final TravelDetailsCubit controller;
  final TravelModel travelModel;
  const TravelDetailsAppbar(
      {super.key, required this.controller, required this.travelModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.sp),
          bottomRight: Radius.circular(25.sp),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 22.sp,
                ),
              ),
              Text(
                "ID: ${travelModel.travelId}",
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white),
              SizedBox(width: 5.w),
              Text(
                "From: ${travelModel.travelFrom} → To: ${travelModel.travelTo}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white),
                  SizedBox(width: 2.w),
                  Text(
                    "Time: ${Jiffy(travelModel.travelDate).Hm}",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Row(
                children: [
                  const Icon(Icons.date_range, color: Colors.white),
                  SizedBox(width: 2.w),
                  Text(
                    Jiffy(travelModel.travelDate).MMMEd,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            "Price: ${travelModel.travelPrice} EGP",
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
