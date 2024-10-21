import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view/modules/main_pages/widgets/account_custom_button.dart';
import 'package:re7la/view/modules/main_pages/widgets/account_info_row.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    infoRow(icon: Icons.person, value: "John Doe"),
                    SizedBox(height: 2.h),
                    infoRow(icon: Icons.email, value: "john.doe@.com"),
                    SizedBox(height: 2.h),
                    infoRow(icon: Icons.phone, value: "+1234567890"),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                customButton(
                  icon: Icons.edit,
                  label: "Edit Profile",
                  color: AppColor.primaryColor,
                  onPressed: () {},
                ),
                SizedBox(height: 2.h),
                customButton(
                  icon: Icons.lock,
                  label: "Change Password",
                  color: Colors.orange,
                  onPressed: () {},
                ),
                SizedBox(height: 2.h),
                customButton(
                  icon: Icons.logout,
                  label: "Logout",
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
