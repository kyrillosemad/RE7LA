import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/text_styles.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/auth/forget_password_email_verification_cubit.dart';
import 'package:re7la/view/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgetPasswordEmailVerification extends StatelessWidget {
  const ForgetPasswordEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgetPasswordEmailVerificationCubit(),
        child: Builder(
          builder: (context) {
            var controller =
                context.read<ForgetPasswordEmailVerificationCubit>();
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
                    BlocBuilder<ForgetPasswordEmailVerificationCubit, AppState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: AppColor.primaryColor,
                              color: Colors.white,
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
                              controller.checkCode(verificationCode, context);
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
