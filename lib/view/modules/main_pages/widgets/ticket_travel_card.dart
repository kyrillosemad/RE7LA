import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/model/ticket_model.dart';
import 'package:re7la/view%20model/main_pages/tickets_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketTravelCard extends StatelessWidget {
  final TicketsCubit controller;
  const TicketTravelCard({super.key, required this.controller});

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
                  TicketModel ticketModel =
                      TicketModel.fromJson(controller.data[index]);
                  return Card(
                    color: const Color.fromARGB(255, 222, 222, 222),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.sp),
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Travel ID: ${ticketModel.travelId}",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                Jiffy(ticketModel.ticketTravelDate).MMMEd,
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.sp),
                          // From and To
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,
                                  color: AppColor.thirdColor),
                              SizedBox(width: 5.w),
                              Text(
                                "From: ${ticketModel.ticketTravelFrom} → To: ${ticketModel.ticketTravelTo}",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey, height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.access_time,
                                      color: AppColor.secondColor),
                                  SizedBox(width: 5.sp),
                                  Text(
                                    "Time: ${Jiffy(ticketModel.ticketTravelDate).Hm}",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.chair_alt,
                                      color: AppColor.secondColor),
                                  SizedBox(width: 5.sp),
                                  Text(
                                    "${ticketModel.seats!.length} Seats",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (ticketModel.seats!.isNotEmpty) ...[
                            const Text("Reserved Seat Details:",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5.sp),
                            Table(
                              columnWidths: {
                                0: FixedColumnWidth(40.w),
                                1: FixedColumnWidth(40.w),
                              },
                              border: TableBorder.all(color: Colors.grey),
                              children: [
                                for (var seat in ticketModel.seats!)
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.chair_alt,
                                                color: AppColor.secondColor),
                                            SizedBox(width: 5.sp),
                                            Text("Seat ${seat.seatNumber}",
                                                style: const TextStyle(
                                                    color:
                                                        AppColor.primaryColor)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "Coach ${seat.seatCoachNumber}",
                                            style: const TextStyle(
                                                color: AppColor.primaryColor)),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 10.h,
                            child: BarcodeWidget(
                              data:
                                  ticketModel.ticketReservationCode.toString(),
                              barcode: Barcode.codabar(
                                explicitStartStop: true,
                                printStartStop: true,
                              ),
                              drawText: false, // إخفاء النص تحت الباركود
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
