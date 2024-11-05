import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/explore_cubit.dart';
import 'package:sizer/sizer.dart';

class SelectDate extends StatelessWidget {
  final ExploreCubit controller;
  const SelectDate({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        width: 85.w,
        height: 7.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: AppColor.primaryColor),
              padding: EdgeInsets.symmetric(vertical: 1.h),
            ),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColor.primaryColor,
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                controller.updateSelectedDate(pickedDate);
              }
            },
            child: BlocBuilder<ExploreCubit, AppState>(
              builder: (context, state) {
                return Row(
                  children: [
                    SizedBox(width: 5.w),
                    const Icon(
                      Icons.date_range,
                      color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 2.w),
                    const Text(
                      'Select Date',
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      controller.selectedDate != null
                          ? "${controller.selectedDate!.day}-${controller.selectedDate!.month}-${controller.selectedDate!.year}"
                          : "Not Selected",
                      style: const TextStyle(color: AppColor.primaryColor),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.updateSelectedDate(null);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: AppColor.primaryColor,
                        ))
                  ],
                );
              },
            )),
      ),
    );
  }
}
