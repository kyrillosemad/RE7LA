import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

Widget infoRow({
  required IconData icon,
  required String value,
}) {
  return Row(
    children: [
      Icon(icon, color: AppColor.thirdColor, size: 18.sp),
      SizedBox(width: 4.w),
      Expanded(
        child: Text(
          " $value",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
