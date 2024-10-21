import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/text_styles.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/auth/signup_email_verification.dart';
import 'package:re7la/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class SignUpEmailVerification extends StatelessWidget {
  const SignUpEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpEmailVerificationCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<SignUpEmailVerificationCubit>();
            return SafeArea(
                child: Scaffold(
              appBar: const CustomAppBar2(title: "Email Verification"),
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Verification Code",
                      style: AppTextStyles().mainTitles,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Enter The Verification Code \n Sent To \n ${controller.email}",
                      style: AppTextStyles().mainBodies,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocBuilder<SignUpEmailVerificationCubit, AppState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return const Center(
                            child: Text(
                              "Check ...",
                              style: TextStyle(
                                  fontSize: 22, color: AppColor.primaryColor),
                            ),
                          );
                        } else {
                          return OtpTextField(
                            fieldWidth: 50,
                            enabledBorderColor: AppColor.black,
                            focusedBorderColor: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                            numberOfFields: 5,
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {},
                            onSubmit: (String verificationCode) {
                              controller.checkCode(
                                  verificationCode.toString(), context);
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
