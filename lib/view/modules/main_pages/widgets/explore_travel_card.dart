import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/main_pages/explore_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:jiffy/jiffy.dart';

class ExploreTravelCard extends StatelessWidget {
  final ExploreCubit controller;
  const ExploreTravelCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
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
                  TravelModel travelModel =
                      TravelModel.fromJson(controller.data[index]);
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Travel ID: ${travelModel.travelId}",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Text(
                                    Jiffy(travelModel.travelDate).yMMMd,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
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
                                "From: ${travelModel.travelFrom} → To: ${travelModel.travelTo}",
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
                                    "Time: ${Jiffy(travelModel.travelDate).Hm}",
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
                                    "${travelModel.travelPrice} EGP",
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
                          InkWell(
                            onTap: () {
                              controller.goToTravelDetails();
                            },
                            child: Container(
                              width: 60.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: const Center(
                                child: Text(
                                  "More Details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
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
