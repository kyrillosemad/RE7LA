import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view/modules/main_pages/screens/bus_booking.dart';
import 'package:sizer/sizer.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String? selectedFrom;
  String? selectedTo;

  final List<String> governorates = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Marsa Matruh',
    'Minya',
    'Monufia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        AppColor.primaryColor,
                        AppColor.primaryColor
                      ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.sp),
                          bottomRight: Radius.circular(25.sp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 10.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.sp),
                            ),
                            DropdownButton<String>(
                              value: selectedFrom,
                              onChanged: (value) {
                                setState(() {
                                  selectedFrom = value;
                                });
                              },
                              hint: const Text(
                                "Select",
                                style: TextStyle(color: Colors.white),
                              ),
                              dropdownColor:
                                  const Color.fromARGB(255, 106, 106, 106),
                              items: governorates.map((String governorate) {
                                return DropdownMenuItem<String>(
                                  value: governorate,
                                  child: Text(
                                    governorate,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(color: Colors.white, thickness: 5),
                      SizedBox(
                        width: 40.w,
                        height: 10.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.sp),
                            ),
                            DropdownButton<String>(
                              value: selectedTo,
                              onChanged: (value) {
                                setState(() {
                                  selectedTo = value;
                                });
                              },
                              dropdownColor:
                                  const Color.fromARGB(255, 106, 106, 106),
                              hint: const Text(
                                "Select",
                                style: TextStyle(color: Colors.white),
                              ),
                              items: governorates.map((String governorate) {
                                return DropdownMenuItem<String>(
                                  value: governorate,
                                  child: Text(
                                    governorate,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  width: 100.w,
                  color: Colors.white,
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
                                  border:
                                      Border.all(color: AppColor.primaryColor)),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "ID: ",
                                        style: TextStyle(
                                            color: AppColor.primaryColor),
                                      ),
                                      Text(
                                        "45458745",
                                        style: TextStyle(
                                            color: AppColor.primaryColor),
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
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Text(
                                                    "Qena",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
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
                                                  const Icon(
                                                    Icons.send,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Text(
                                                    "Cairo",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 13.sp),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                      const VerticalDivider(
                                        color: AppColor.primaryColor,
                                      ),
                                      SizedBox(
                                          width: 40.w,
                                          height: 12.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Date: ",
                                                    style: TextStyle(
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    "15/5/2024",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .primaryColor),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Time: ",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .primaryColor),
                                                  ),
                                                  Text(
                                                    "10 pm",
                                                    style: TextStyle(
                                                        color: AppColor.grey2),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "price: ",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .primaryColor),
                                                  ),
                                                  Text(
                                                    "250 EGP",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .primaryColor),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(const BusBooking());
                                    },
                                    child: Container(
                                      width: 70.w,
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
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ))
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
