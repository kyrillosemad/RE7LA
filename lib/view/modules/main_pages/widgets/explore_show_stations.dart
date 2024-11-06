import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:sizer/sizer.dart';

class ExploreShowStations extends StatelessWidget {
  final TravelModel travelModel;
  const ExploreShowStations({super.key, required this.travelModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Stations Details',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: travelModel.stations!.map<Widget>((station) {
                    return Card(
                      color: const Color.fromARGB(255, 245, 245, 245),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColor.primaryColor,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 10.sp),
                                Expanded(
                                  child: Text(
                                    station.stationName ?? 'Unknown Station',
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.sp),
                            Row(
                              children: [
                                Text(
                                  'Date:',
                                  style: TextStyle(
                                    color: AppColor.secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(width: 5.sp),
                                Text(
                                  Jiffy(station.stationArrivalDate)
                                      .format('yyyy-MM-dd'),
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.sp),
                            Row(
                              children: [
                                Text(
                                  'Time:',
                                  style: TextStyle(
                                    color: AppColor.secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(width: 5.sp),
                                Text(
                                  Jiffy(station.stationArrivalDate)
                                      .format('HH:mm'),
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Close',
                    style:
                        TextStyle(fontSize: 20, color: AppColor.primaryColor),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 40.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: const Center(
          child: Text(
            "Show Stations",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
