import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

Widget customButton({
  required IconData icon,
  required String label,
  required Color color,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: ListTile(
      title: Text(
        label,
        style: const TextStyle(color: AppColor.primaryColor),
      ),
      trailing: Icon(
        icon,
        color: AppColor.thirdColor,
      ),
    ),
  );
}
