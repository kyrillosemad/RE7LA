import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/colors.dart';
import 'package:sizer/sizer.dart';

class BusBooking extends StatefulWidget {
  const BusBooking({super.key});

  @override
  State<BusBooking> createState() => _BusBookingState();
}

class _BusBookingState extends State<BusBooking> {
  List<bool> seatSelected = List.generate(49, (index) => false);
  List<bool> seatBooked = List.generate(49, (index) => index % 3 == 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: MyColors().mainBlue,
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                      SizedBox(width: 10.w),
                      const Icon(Icons.send, color: Colors.white),
                      SizedBox(width: 2.w),
                      Text("To: Cairo",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Date: 15/5/2024",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                      SizedBox(width: 5.w),
                      Text("Time: 10 pm",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Price: 250 EGP",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp)),
                      InkWell(
                        child: Icon(
                          Icons.map_outlined,
                          color: Colors.white,
                          size: 30.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h),
            // Seat Selection Legend
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.event_seat, color: Colors.grey),
                      SizedBox(width: 1.w),
                      Text("Available",
                          style:
                              TextStyle(color: Colors.grey, fontSize: 10.sp)),
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
                      Icon(Icons.event_seat, color: MyColors().mainGreen),
                      SizedBox(width: 1.w),
                      Text("Selected",
                          style: TextStyle(
                              color: MyColors().mainGreen, fontSize: 10.sp)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.sp,
                    mainAxisSpacing: 5.sp,
                  ),
                  itemCount: seatSelected.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: seatBooked[index]
                          ? null
                          : () {
                              setState(() {
                                seatSelected[index] = !seatSelected[index];
                                print(seatSelected);
                              });
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          color: seatBooked[index]
                              ? Colors.red
                              : seatSelected[index]
                                  ? MyColors().mainGreen
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Center(
                          child: Text(
                            "Seat ${index + 1}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 8.sp),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 1.h),
            // Confirm Booking Button
            Container(
              width: 80.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: MyColors().mainGreen,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Center(
                child: Text(
                  "Confirm Booking",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
