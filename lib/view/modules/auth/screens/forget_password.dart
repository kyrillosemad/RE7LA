import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/text_styles.dart';
import 'package:re7la/core/functions/validator.dart';
import 'package:re7la/view%20model/auth/forget_password_cubit.dart';
import 'package:re7la/view/modules/intro_screen/widgets/custom_button.dart';
import 'package:re7la/view/widgets/custom_appbar.dart';
import 'package:re7la/view/widgets/custom_field.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<ForgetPasswordCubit>();
          return SafeArea(
              child: Scaffold(
            appBar: const CustomAppBar2(title: "Forget Password"),
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Check Email",
                    style: AppTextStyles().mainTitles,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Enter Your Email Now \n To Receive A Verification Code",
                    style: AppTextStyles().mainBodies,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Form(
                      key: controller.key,
                      child: Column(
                        children: [
                          CustomField(
                            controller: controller.email,
                            title: "Email",
                            icon: const Icon(Icons.email),
                            isSecured: false,
                            type: TextInputType.emailAddress,
                            iconFun: () {},
                            validator: (value) {
                          return  validator(value, 30, 10, "email");
                             
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomButton(
                              title: "Send",
                              onTap: () {
                                controller.goToVerificationCode();
                              },
                              textColor: Colors.white,
                              borderColor: Colors.transparent,
                              color: AppColor.primaryColor)
                        ],
                      ))
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
