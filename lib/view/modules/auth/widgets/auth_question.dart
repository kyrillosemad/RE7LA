import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class AuthQuestion extends StatelessWidget {
  final String text1;
  final String text2;
  final Function onTap;
  const AuthQuestion(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 15.sp),
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            text2,
            style: TextStyle(fontSize: 15.sp, color: AppColor.thirdColor),
          ),
        ),
      ],
    );
  }
}
