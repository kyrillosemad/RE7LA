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
      return Center(
        child: Lottie.asset(AppImages().loading, height: 200),
      );
    } else if (state is Success) {
      return widget;
    } else if (state is Empty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty,
              size: 50,
              color: AppColor.primaryColor,
            ),
            Center(
              child: Text("Not Founded",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  )),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    } else if (state is EmptySearch) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 50,
              color: AppColor.primaryColor,
            ),
            Center(
              child: Text("Please Enter Your Destination",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  )),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
