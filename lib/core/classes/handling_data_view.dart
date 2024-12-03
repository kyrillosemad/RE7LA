import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/images.dart';
import '../../view model/app_states.dart';

class HandlingDataView extends StatelessWidget {
  final AppState state;
  final Widget widget;

  const HandlingDataView({
    super.key,
    required this.state,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    if (state is InternetError) {
      return Center(
        child: Lottie.asset(AppImages().offline, height: 250),
      );
    } else if (state is ServerError) {
      return Center(
        child: Lottie.asset(AppImages().error, height: 300),
      );
    } else if (state is Loading) {
      return const Center(
        child: Center(
          child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: AppColor.primaryColor,
              strokeWidth: 5),
        ),
      );
    } else if (state is Success) {
      return widget;
    } else if (state is Empty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppImages().trainImage),
              height: 180,
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text("Not Founded",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    } else if (state is EmptySearch) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppImages().locationImage)),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
