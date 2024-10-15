import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Quick & Easy \n To travel \n anywhere & anytime ",
      style: TextStyle(fontSize: 22.sp, color: AppColor.primaryColor),
      textAlign: TextAlign.center,
    );
  }
}
