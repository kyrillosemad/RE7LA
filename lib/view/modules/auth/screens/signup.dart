import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/core/functions/validator.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/auth/signup_cubit.dart';
import 'package:re7la/view/modules/auth/widgets/auth_question.dart';
import 'package:re7la/view/modules/auth/widgets/body.dart';
import 'package:re7la/view/modules/auth/widgets/custom_auth_button.dart';
import 'package:re7la/view/modules/auth/widgets/logo.dart';
import 'package:re7la/view/modules/auth/widgets/title.dart';
import 'package:re7la/view/widgets/custom_field.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<SignUpCubit>();
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
                        const TitleText(title: "SignUp"),
                        const AuthLogo(),
                        const BodyText(
                            body: "SignUp Now \n With Your Email And Password"),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 90.w,
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                CustomField(
                                    validator: (value) {
                                      return validator(
                                          value, 30, 4, "username");
                                    },
                                    iconFun: controller.changeSecure,
                                    type: TextInputType.name,
                                    controller: controller.userName,
                                    title: "UserName",
                                    icon: const Icon(Icons.person),
                                    isSecured: false),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomField(
                                    validator: (value) {
                                      return validator(value, 30, 10, "email");
                                    },
                                    iconFun: controller.changeSecure,
                                    type: TextInputType.name,
                                    controller: controller.email,
                                    title: "Email",
                                    icon: const Icon(Icons.email),
                                    isSecured: false),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomField(
                                    validator: (value) {
                                      return validator(value, 20, 10, "phone");
                                    },
                                    iconFun: controller.changeSecure,
                                    type: TextInputType.phone,
                                    controller: controller.phone,
                                    title: "Phone",
                                    icon: const Icon(Icons.phone),
                                    isSecured: false),
                                const SizedBox(
                                  height: 15,
                                ),
                                BlocBuilder<SignUpCubit, AppState>(
                                  builder: (context, state) {
                                    return CustomField(
                                        validator: (value) {
                                          return validator(
                                              value, 30, 4, "password");
                                        },
                                        iconFun: controller.changeSecure,
                                        type: TextInputType.name,
                                        controller: controller.password,
                                        title: "Password",
                                        icon: controller.isSecure == true
                                            ? const Icon(Icons.lock_outline)
                                            : const Icon(Icons.lock_open),
                                        isSecured: controller.isSecure);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
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
                        CustomAuthButton(text: "SignUp", onTap: () {}),
                        SizedBox(
                          height: 3.h,
                        ),
                        AuthQuestion(
                            text1: "Have An Account ?",
                            text2: "Login",
                            onTap: () {
                              controller.goToLogin();
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
