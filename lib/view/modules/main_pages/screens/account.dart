import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/view%20model/main_pages/account_cubit.dart';
import 'package:re7la/view/modules/main_pages/widgets/account_custom_button.dart';
import 'package:re7la/view/modules/main_pages/widgets/account_info_row.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => AccountCubit(),
      child: Builder(
        builder: (context) {
          var controller = context.read<AccountCubit>();
          return Scaffold(
            body: WillPopScope(
              onWillPop: appExitAlert,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 35),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              "Personal Info",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          infoRow(
                              icon: Icons.person,
                              value: "${controller.userName}"),
                          SizedBox(height: 2.h),
                          infoRow(
                              icon: Icons.email,
                              value: "${controller.userEmail}"),
                          SizedBox(height: 2.h),
                          infoRow(
                              icon: Icons.phone,
                              value: "${controller.userPhone}"),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          color: const Color.fromARGB(255, 220, 220, 220),
                          child: customButton(
                            icon: Icons.logout,
                            label: "Logout",
                            color: Colors.red,
                            onPressed: () {
                              Get.defaultDialog(
                                title: "Are You Sure To Logout ?",
                                titleStyle: const TextStyle(
                                    color: AppColor.primaryColor),
                                content: Container(),
                                confirmTextColor: Colors.white,
                                cancelTextColor: AppColor.primaryColor,
                                buttonColor: AppColor.primaryColor,
                                onCancel: () {},
                                onConfirm: () {
                                  controller.logout();
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
