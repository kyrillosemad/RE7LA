import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/account_cubit.dart';
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
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: AppColor.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              "Personal Info",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3.h),
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
                          ],
                        ),
                      ),
                    ),

                    // زر الإشعارات
                    Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.notifications,
                              color: AppColor.primaryColor),
                          title: const Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          trailing: BlocBuilder<AccountCubit, AppState>(
                            builder: (context, state) {
                              return Switch(
                                activeColor: AppColor.primaryColor,
                                value: controller.value,
                                onChanged: (newValue) {
                                  if (controller.value == true) {
                                    Get.defaultDialog(
                                      title: "Disable notifications ?",
                                      content: Container(),
                                      titleStyle: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 18,
                                      ),
                                      confirmTextColor: Colors.white,
                                      cancelTextColor: AppColor.primaryColor,
                                      buttonColor: AppColor.primaryColor,
                                      onCancel: () {
                                        Get.back();
                                      },
                                      onConfirm: () {
                                        Get.back();
                                        controller.disableNotifications();
                                      },
                                    );
                                  } else {
                                    controller.activateNotifications();
                                  }
                                },
                              );
                            },
                          ),
                        )),

                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.logout_outlined,
                            color: Colors.redAccent),
                        title: const Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        onTap: () {
                          Get.defaultDialog(
                            title: "Are You Sure To Logout?",
                            content: Container(),
                            titleStyle: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 18,
                            ),
                            confirmTextColor: Colors.white,
                            cancelTextColor: AppColor.primaryColor,
                            buttonColor: AppColor.primaryColor,
                            onCancel: () {},
                            onConfirm: () {
                              controller.logout();
                            },
                          );
                        },
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
