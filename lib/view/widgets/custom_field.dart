// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Widget icon;
  final bool isSecured;
  final TextInputType type;
  final Function() iconFun;
  final String? Function(String?)? validator;
  const CustomField({
    required this.controller,
    required this.title,
    required this.icon,
    required this.isSecured,
    required this.type,
    required this.iconFun,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Center(
        child: TextFormField(
          keyboardType: type,
          cursorColor: AppColor.grey,
          obscureText: isSecured,
          cursorHeight: 3.h,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: iconFun,
              icon: Padding(
                padding: const EdgeInsets.all(1),
                child: icon,
              ),
            ),
            suffixIconColor: AppColor.primaryColor,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: AppColor.grey),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: AppColor.grey),
            ),
            label: Text(
              title,
              style: TextStyle(fontSize: 12.sp, color: AppColor.grey),
            ),
          ),
        ),
      ),
    );
  }
}
