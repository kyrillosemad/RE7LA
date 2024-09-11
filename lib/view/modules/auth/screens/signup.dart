import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/colors.dart';
import 'package:re7la/view/modules/auth/screens/login.dart';
import 'package:re7la/view/modules/auth/widgets/email_field.dart';
import 'package:re7la/view/modules/auth/widgets/logo.dart';
import 'package:re7la/view/modules/auth/widgets/password_field.dart';
import 'package:re7la/view/modules/auth/widgets/phone_field.dart';
import 'package:re7la/view/modules/auth/widgets/username_field.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> form2 = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "RE7LA",
                  style: TextStyle(fontSize: 30.sp, color: MyColors().mainBlue),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Logo(),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Form(
                      key: form2,
                      child: Column(
                        children: [
                          UserNameField(controller: username),
                          EmailField(controller: email),
                          PhoneField(controller: phone),
                          PasswordField(controller: password),
                        ],
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DO you have account ? ",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to((const Login()));
                      },
                      child: Text(
                        "login",
                        style: TextStyle(
                            fontSize: 15.sp, color: MyColors().mainBlue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                        color: MyColors().mainBlue,
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Center(
                      child: Text(
                        "sign up",
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
