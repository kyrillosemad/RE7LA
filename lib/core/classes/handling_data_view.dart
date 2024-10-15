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
      return Center(
        child: Lottie.asset(AppImages().error, height: 170),
      );
    } else if (state is ServerError) {
      return Center(
        child: Lottie.asset(AppImages().error, height: 200),
      );
    } else if (state is Loading) {
      return Center(
        child: Lottie.asset(AppImages().loading, height: 140),
      );
    } else if (state is Success) {
      return widget;
    } else if (state is Empty) {
      return Center(
        child: Lottie.asset(AppImages().error2, height: 200),
      );
    } else {
      return Container();
    }
  }
}
