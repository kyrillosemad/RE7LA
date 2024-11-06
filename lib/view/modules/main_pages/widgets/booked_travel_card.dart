// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/model/booked_travel_model.dart';
import 'package:re7la/view%20model/main_pages/booked_cubit.dart';
import 'package:re7la/view/modules/main_pages/widgets/booked_show_stations.dart';
import 'package:sizer/sizer.dart';

class BookedTravelCard extends StatelessWidget {
  BookedCubit controller;
  BookedTravelCard({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 1.h),
          Expanded(
            child: Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  BookedTravelModel bookedTravelMode =
                      BookedTravelModel.fromJson(controller.data[index]);
                  return Card(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.sp),
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Travel ID: ${bookedTravelMode.travelId}",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                Jiffy(bookedTravelMode.travelDate).MMMEd,
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.sp),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,
                                  color: AppColor.thirdColor),
                              SizedBox(width: 5.w),
                              Text(
                                "${bookedTravelMode.travelFrom} → ...... → ${bookedTravelMode.travelTo}",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.access_time,
                                      color: AppColor.secondColor),
                                  SizedBox(width: 5.sp),
                                  Text(
                                    "Time: ${Jiffy(bookedTravelMode.travelDate).Hm}",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.money,
                                      color: AppColor.secondColor),
                                  SizedBox(width: 5.sp),
                                  Text(
                                    "${bookedTravelMode.travelPrice} EGP",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          BookedShowStations(
                              bookedTravelModel: bookedTravelMode),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
