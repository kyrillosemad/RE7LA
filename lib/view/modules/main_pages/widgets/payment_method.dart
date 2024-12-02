import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class PaymentMethod extends StatelessWidget {
  final String name;
  final void Function()? function;
  final Widget widget;

  const PaymentMethod({
    super.key,
    required this.function,
    required this.name,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      borderRadius: BorderRadius.circular(12),
      splashColor: AppColor.primaryColor.withOpacity(0.2),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: 15.w,
                  child: widget,
                ),
              ),
              Expanded(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
