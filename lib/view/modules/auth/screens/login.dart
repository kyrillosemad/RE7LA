import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/core/functions/validator.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/auth/login_cubit.dart';
import 'package:re7la/view/modules/auth/widgets/auth_question.dart';
import 'package:re7la/view/modules/auth/widgets/body.dart';
import 'package:re7la/view/modules/auth/widgets/custom_auth_button.dart';
import 'package:re7la/view/modules/auth/widgets/title.dart';
import 'package:re7la/view/widgets/custom_field.dart';
import 'package:re7la/view/modules/auth/widgets/logo.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<LoginCubit>();
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: WillPopScope(
                onWillPop: appExitAlert,
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TitleText(title: "Login"),
                        const AuthLogo(),
                        const BodyText(
                            body: "Login Now \n With Your Email And Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 90.w,
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                CustomField(
                                  validator: (value) {
                                    return validator(value, 30, 10, "email");
                                  },
                                  iconFun: controller.changeSecure,
                                  type: TextInputType.emailAddress,
                                  controller: controller.email,
                                  title: "Email",
                                  icon: const Icon(Icons.email),
                                  isSecured: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                BlocBuilder<LoginCubit, AppState>(
                                  builder: (context, state) {
                                    return CustomField(
                                      validator: (value) {
                                        return validator(
                                            value, 30, 4, "password");
                                      },
                                      iconFun: controller.changeSecure,
                                      type: TextInputType.visiblePassword,
                                      controller: controller.password,
                                      title: "Password",
                                      icon: Icon(controller.isSecure
                                          ? Icons.lock_outline
                                          : Icons.lock_open),
                                      isSecured: controller.isSecure,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(
                                fontSize: 17, color: AppColor.thirdColor),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        BlocBuilder<LoginCubit, AppState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primaryColor,
                                ),
                              );
                            } else {
                              return CustomAuthButton(
                                  text: "Login",
                                  onTap: () {
                                    controller.login(context);
                                  });
                            }
                          },
                        ),
                        SizedBox(height: 4.h),
                        AuthQuestion(
                            text1: "have No account ? ",
                            text2: "sign up",
                            onTap: () {
                              controller.goToSignUp();
                            }),
                      ],
                    ),
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
