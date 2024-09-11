// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhoneField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  PhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 10.h,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        validator: (value) {
          if (value!.length < 10) {
            return 'must be greater than 10 letters';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          label: Text(
            "Phone",
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
