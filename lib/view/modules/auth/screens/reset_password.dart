import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/text_styles.dart';
import 'package:re7la/core/functions/validator.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/auth/reset_password_cubit.dart';
import 'package:re7la/view/modules/intro_screen/widgets/custom_button.dart';
import 'package:re7la/view/widgets/custom_appbar.dart';
import 'package:re7la/view/widgets/custom_field.dart';
import 'package:sizer/sizer.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<ResetPasswordCubit>();
          return SafeArea(
              child: Scaffold(
            appBar: const CustomAppBar2(title: "Reset Password"),
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "New Password",
                    style: AppTextStyles().mainTitles,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Please Enter A New Password",
                    style: AppTextStyles().mainBodies,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  BlocBuilder<ResetPasswordCubit, AppState>(
                    builder: (context, state) {
                      return Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            CustomField(
                              controller: controller.password,
                              title: "Password",
                              icon: controller.isSecured == true
                                  ? const Icon(Icons.lock_outline)
                                  : const Icon(Icons.lock_open),
                              isSecured: controller.isSecured,
                              type: TextInputType.name,
                              iconFun: controller.changeSecured,
                              validator: (value) {
                                return validator(value, 30, 4, "password");
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomField(
                              controller: controller.newPassword,
                              title: "New Password",
                              icon: controller.newPasswordIsSecured == true
                                  ? const Icon(Icons.lock_outline)
                                  : const Icon(Icons.lock_open),
                              isSecured: controller.newPasswordIsSecured,
                              type: TextInputType.name,
                              iconFun: controller.newPasswordChangeSecured,
                              validator: (value) {
                                return validator(value, 30, 4, "password");
                              },
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            BlocBuilder<ResetPasswordCubit, AppState>(
                              builder: (context, state) {
                                if (state is Loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: AppColor.primaryColor,
                                      color: Colors.white,
                                    ),
                                  );
                                } else {
                                  return CustomButton(
                                      title: "Save",
                                      onTap: () {
                                        controller.resetPassword(context);
                                      },
                                      textColor: Colors.white,
                                      borderColor: Colors.transparent,
                                      color: AppColor.primaryColor);
                                }
                              },
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
