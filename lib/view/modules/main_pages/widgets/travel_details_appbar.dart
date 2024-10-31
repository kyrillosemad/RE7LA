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
                "ID: ${widget.travelModel.travelId}",
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
                "From: ${widget.travelModel.travelFrom} → To: ${widget.travelModel.travelTo}",
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
                    "Time: ${Jiffy(widget.travelModel.travelDate).Hm}",
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
                    Jiffy(widget.travelModel.travelDate).MMMEd,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Price: ${widget.travelModel.travelPrice} EGP",
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
              Text(
                "Type: ${widget.travelModel.travelType}",
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
              DropdownButton<String>(
                value: widget.controller.coachNumber.toString(),
                onChanged: (value) {
                  setState(() {
                    widget.controller.coachNumber = int.parse(value!);
                  });
                },
                dropdownColor: const Color.fromARGB(255, 106, 106, 106),
                hint: const Text(
                  "Select",
                  style: TextStyle(color: Colors.white),
                ),
                items: List.generate(
                  widget.controller.data['coaches'].length,
                  (index) => DropdownMenuItem<String>(
                    value: index.toString(),
                    child: Text(
                      'Coach ${index + 1}',
                      style: const TextStyle(color: Colors.white),
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
