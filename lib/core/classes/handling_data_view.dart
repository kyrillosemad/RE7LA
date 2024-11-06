import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
      print("internet_error");
      return Center(
        child: Lottie.asset(AppImages().error, height: 170),
      );
    } else if (state is ServerError) {
      print("server_error");
      return Center(
        child: Lottie.asset(AppImages().error2, height: 300),
      );
    } else if (state is Loading) {
      print("loading");
      return Center(
        child: Lottie.asset(AppImages().error2, height: 400),
      );
    } else if (state is Success) {
      print("success");
      return widget;
    } else if (state is Empty) {
      print("empty");
      return Center(
        child: Lottie.asset(AppImages().error2, height: 200),
      );
    } else if (state is EmptySearch) {
      print("empty Search");
      return const Center(
        child: Text("Please Enter Your Distination"),
      );
    } else {
      return Container();
    }
  }
}
