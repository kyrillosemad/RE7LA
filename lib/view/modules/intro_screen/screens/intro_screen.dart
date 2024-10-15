import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/view model/intro/intro_cubit.dart';
import 'package:re7la/view/modules/intro_screen/widgets/custom_button.dart';
import 'package:re7la/view/modules/intro_screen/widgets/intro_title.dart';
import 'package:re7la/view/modules/intro_screen/widgets/logo.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<IntroCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            body: WillPopScope(
              onWillPop: appExitAlert,
              child: SafeArea(
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        "RE7LA",
                        style: TextStyle(
                          fontSize: 35.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const Logo(),
                      SizedBox(height: 3.h),
                      const IntroTitle(),
                      SizedBox(height: 4.h),
                      Column(
                        children: [
                          CustomButton(
                            title: "Login",
                            onTap: () {
                              controller.goToLogin();
                            },
                            borderColor: Colors.transparent,
                            textColor: Colors.white,
                            color: AppColor.primaryColor,
                          ),
                          SizedBox(height: 2.h),
                          CustomButton(
                            title: "SignUp",
                            onTap: () {
                              controller.goToSignUp();
                            },
                            borderColor: AppColor.thirdColor,
                            textColor: AppColor.thirdColor,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
