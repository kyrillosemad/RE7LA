import 'package:flutter/material.dart';
import 'package:re7la/core/constants/images.dart';
import 'package:sizer/sizer.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 20.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages().logo)),
      ),
    );
  }
}
