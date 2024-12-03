import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/images.dart';
import 'package:re7la/view%20model/main_pages/success_reservation_cubit.dart';
import 'package:sizer/sizer.dart';

class SuccessReservation extends StatelessWidget {
  const SuccessReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SuccessReservationCubit(),
        child: Builder(
          builder: (context) {
            SuccessReservationCubit controller =
                context.read<SuccessReservationCubit>();
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image(
                      image: AssetImage(
                        AppImages().approved,
                      ),
                      width: 80.w,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Success Reservation",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Enjoy Your Trip With Us",
                      style:
                          TextStyle(fontSize: 17, color: AppColor.secondColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToHomePage();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColor.secondColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: 80.w,
                        height: 7.h,
                        child: const Center(
                          child: Text(
                            "Ok",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
