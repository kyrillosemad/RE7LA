// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String title;
  void Function()? onTap;
  Color? color;
  Color? textColor;
  Color? borderColor;
  CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.textColor,
      required this.borderColor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 7.h,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: 2),
            color: color,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 18),
        )),
      ),
    );
  }
}
