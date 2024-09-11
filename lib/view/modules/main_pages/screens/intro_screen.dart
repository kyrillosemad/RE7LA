import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/colors.dart';
import 'package:re7la/view/modules/auth/screens/login.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Book",
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: MyColors().mainGreen,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Now",
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: MyColors().mainBlue,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "RE7LA",
              style: TextStyle(fontSize: 35.sp, color: MyColors().mainBlue),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 80.w,
              height: 35.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images.png",
                      ),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Quick & Easy to travel anywhere & anytime ",
              style: TextStyle(fontSize: 27.sp, color: MyColors().mainBlue),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
                child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: MyColors().mainBlue,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50.sp))),
                ),
                Container(
                  margin: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      color: MyColors().mainGreen,
                      borderRadius: BorderRadius.circular(20.sp)),
                  width: 80.w,
                  height: 8.h,
                  child: Center(
                      child: InkWell(
                    onTap: () {
                      Get.offAll(const Login());
                    },
                    child: Text(
                      "Start Now              >>",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  )),
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
