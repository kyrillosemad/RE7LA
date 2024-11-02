import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/main_pages/travel_details_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/colors.dart';

class TravelDetailsAppbar extends StatefulWidget {
  final TravelDetailsCubit controller;
  final TravelModel travelModel;

  const TravelDetailsAppbar({
    super.key,
    required this.controller,
    required this.travelModel,
  });

  @override
  State<TravelDetailsAppbar> createState() => _TravelDetailsAppbarState();
}

class _TravelDetailsAppbarState extends State<TravelDetailsAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.sp),
          bottomRight: Radius.circular(20.sp),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row with back button and travel ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 22.sp),
              ),
              Text(
                "ID: ${widget.travelModel.travelId}",
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 1.h),

          // Location and Destination Row
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  color: Colors.white, size: 18.sp),
              SizedBox(width: 4.w),
              Flexible(
                child: Text(
                  "From: ${widget.travelModel.travelFrom} → To: ${widget.travelModel.travelTo}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),

          // Time and Date Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white, size: 18.sp),
                  SizedBox(width: 1.5.w),
                  Text(
                    "Time: ${Jiffy(widget.travelModel.travelDate).Hm}",
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.date_range, color: Colors.white, size: 18.sp),
                  SizedBox(width: 1.5.w),
                  Text(
                    Jiffy(widget.travelModel.travelDate).MMMEd,
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),

          // Price, Type, and Coach Dropdown Row with improved layout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price: ${widget.travelModel.travelPrice} EGP",
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "Type: ${widget.travelModel.travelType}",
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ],
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: DropdownButton<String>(
                    iconEnabledColor: AppColor.primaryColor,
                    focusColor: Colors.black,
                    underline: Container(),
                    value: widget.controller.coachNumber.toString(),
                    onChanged: (value) {
                      setState(() {
                        widget.controller.coachNumber = int.parse(value!);
                        widget.controller
                            .viewSeats(widget.controller.coachNumber);
                      });
                    },
                    dropdownColor: Colors.white,
                    hint: const Text(
                      "Select",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    items: List.generate(
                      widget.controller.data['coaches'].length,
                      (index) => DropdownMenuItem<String>(
                        value: index.toString(),
                        child: Text(
                          'Coach ${index + 1}',
                          style: const TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
