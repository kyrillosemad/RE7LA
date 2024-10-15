import 'package:flutter/material.dart';
import 'package:re7la/core/constants/text_styles.dart';

class BodyText extends StatelessWidget {
  final String body;
  const BodyText({super.key,required this.body});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      body,
      style: AppTextStyles().mainBodies,
      textAlign: TextAlign.center,
    ));
  }
}
