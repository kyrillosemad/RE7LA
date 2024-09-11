import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:re7la/view/modules/main_pages/screens/intro_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const re7la());
}

class re7la extends StatelessWidget {
  const re7la({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GetMaterialApp(
          home: IntroScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
