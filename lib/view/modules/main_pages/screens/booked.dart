import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "All Booked Travels",
                style: TextStyle(fontSize: 18.sp, color:  AppColor.primaryColor),
              ),
              Icon(
                Icons.bookmark_added,
                color:  AppColor.primaryColor,
                size: 25.sp,
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                    child: SizedBox(
                  width: 95.w,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 23.h,
                        width: 80.w,
                        padding: EdgeInsets.all(5.sp),
                        margin: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color:  AppColor.primaryColor)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ID: ",
                                  style: TextStyle(color: AppColor.primaryColor),
                                ),
                                Text(
                                  "45458745",
                                  style: TextStyle(color:  AppColor.primaryColor),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 40.w,
                                    height: 12.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: AppColor.primaryColor,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              "Qena",
                                              style: TextStyle(
                                                  color:  AppColor.primaryColor,
                                                  fontSize: 13.sp),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.send,
                                              color: AppColor.primaryColor,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              "Cairo",
                                              style: TextStyle(
                                                  color:  AppColor.primaryColor,
                                                  fontSize: 13.sp),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                                VerticalDivider(
                                  color:  AppColor.primaryColor,
                                ),
                                SizedBox(
                                    width: 40.w,
                                    height: 12.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Date: ",
                                              style: TextStyle(
                                                  color: AppColor.primaryColor),
                                            ),
                                            Text(
                                              "15/5/2024",
                                              style: TextStyle(
                                                  color:  AppColor.primaryColor),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Time: ",
                                              style: TextStyle(
                                                  color: AppColor.primaryColor),
                                            ),
                                            Text(
                                              "10 pm",
                                              style: TextStyle(
                                                  color:  AppColor.primaryColor),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "price: ",
                                              style: TextStyle(
                                                  color: AppColor.primaryColor),
                                            ),
                                            Text(
                                              "250 EGP",
                                              style: TextStyle(
                                                  color:  AppColor.primaryColor),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 35.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(10.sp)),
                                  child: const Center(
                                    child: Text(
                                      "Cancel Booking",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.sp)),
                                  child: const Center(
                                    child: Text(
                                      "More Details",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:  AppColor.primaryColor, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: Center(
                                    child: Icon(
                                      Icons.qr_code,
                                      size: 35.sp,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
