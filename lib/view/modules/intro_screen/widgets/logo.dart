import 'package:flutter/material.dart';
import 'package:re7la/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 35.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImages().logo,
              ),
              fit: BoxFit.contain)),
    );
  }
}
