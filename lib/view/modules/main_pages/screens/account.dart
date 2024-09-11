import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/colors.dart';
import 'package:re7la/view/modules/auth/screens/login.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة الملف الشخصي
              CircleAvatar(
                backgroundColor: MyColors().mainBlue,
                radius: 40.sp,
                backgroundImage:
                    const AssetImage('assets/images/profile_picture.png'),
                child: Text(
                  "KY",
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
              ),
              SizedBox(height: 2.h),

              // بطاقة معلومات المستخدم
              Container(
                padding: EdgeInsets.all(15.sp),
                margin: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.sp),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoRow(
                        icon: Icons.person, label: "Name", value: "John Doe"),
                    SizedBox(height: 2.h),
                    infoRow(
                        icon: Icons.email,
                        label: "Email",
                        value: "john.doe@.com"),
                    SizedBox(height: 2.h),
                    infoRow(
                        icon: Icons.phone,
                        label: "Phone",
                        value: "+1234567890"),
                    SizedBox(height: 2.h),
                    infoRow(
                        icon: Icons.lock,
                        label: "Password",
                        value: "************"),
                  ],
                ),
              ),

              // زرار تعديل المعلومات الشخصية
              customButton(
                icon: Icons.edit,
                label: "Edit Profile",
                color: MyColors().mainBlue,
                onPressed: () {
                  // Navigate to edit profile page
                },
              ),
              SizedBox(height: 2.h),

              // زرار تغيير كلمة السر
              customButton(
                icon: Icons.lock,
                label: "Change Password",
                color: Colors.orange,
                onPressed: () {
                  // Navigate to change password page
                },
              ),
              SizedBox(height: 2.h),

              // زر تسجيل الخروج
              customButton(
                icon: Icons.logout,
                label: "Logout",
                color: Colors.red,
                onPressed: () {
                  Get.offAll(const Login());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // تصميم مخصص لزرار
  Widget customButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 18.sp),
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }

  // تصميم مخصص لعرض المعلومات الشخصية
  Widget infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: MyColors().mainBlue, size: 18.sp),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            "$label: $value",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.sp,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
