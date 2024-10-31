import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/routes.dart';
import 'package:re7la/core/constants/theme.dart';
import 'package:re7la/core/services/services.dart';
import 'package:re7la/view/modules/intro_screen/screens/intro_screen.dart';
import 'package:re7la/view/modules/main_pages/screens/home_Page.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final services = Get.put(Services());
  await services.init();
  runApp(const Re7la());
}

class Re7la extends StatelessWidget {
  const Re7la({super.key});

  @override
  Widget build(BuildContext context) {
    Services services = Get.find<Services>();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          home: services.sharedPref!.getString("userId") == null
              ? const IntroScreen()
              : const HomePage(),
          debugShowCheckedModeBanner: false,
          routes: routes,
          theme: theme,
        );
      },
    );  
  }
}
