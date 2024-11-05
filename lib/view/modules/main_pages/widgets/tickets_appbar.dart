import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class TicketsAppbar extends StatelessWidget {
  const TicketsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "All Tickets",
          style: TextStyle(fontSize: 18.sp, color: AppColor.primaryColor),
        ),
        Icon(
          Icons.bookmark_added,
          color: AppColor.thirdColor,
          size: 25.sp,
        )
      ],
    );
  }
}
