import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomAuthButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 80.w,
        height: 7.h,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
