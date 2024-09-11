import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/core/colors.dart';
import 'package:re7la/view/modules/auth/screens/signup.dart';
import 'package:re7la/view/modules/auth/widgets/email_field.dart';
import 'package:re7la/view/modules/auth/widgets/logo.dart';
import 'package:re7la/view/modules/auth/widgets/password_field.dart';
import 'package:re7la/view/modules/main_pages/screens/home_Page.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                SizedBox(height: 7.h),
                Text(
                  "RE7LA",
                  style: TextStyle(fontSize: 30.sp, color: MyColors().mainBlue),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Logo(),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 90.w,
                  height: 22.h,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        EmailField(controller: emailController),
                        PasswordField(controller: passwordController),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have Not account ? ",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const SignUp());
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(
                            fontSize: 15.sp, color: MyColors().mainBlue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Get.offAll(const HomePage());
                  },
                  child: Container(
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: MyColors().mainBlue,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Center(
                      child: Text(
                        "login",
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
