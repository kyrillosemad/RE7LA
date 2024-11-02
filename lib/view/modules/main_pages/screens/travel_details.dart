import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/constants/images.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/travel_details_cubit.dart';
import 'package:re7la/view/modules/main_pages/widgets/travel_details_appbar.dart';
import 'package:re7la/view/modules/main_pages/widgets/travel_details_bus_seats.dart';
import 'package:re7la/view/modules/main_pages/widgets/travel_details_confirm_button.dart';
import 'package:re7la/view/modules/main_pages/widgets/travel_details_custom_row.dart';
import 'package:sizer/sizer.dart';

class TravelDetails extends StatefulWidget {
  const TravelDetails({super.key});

  @override
  State<TravelDetails> createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TravelDetailsCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<TravelDetailsCubit>();
            TravelModel travelModel = TravelModel.fromJson(controller.data);
            return SafeArea(
              child: Column(
                children: [
                  TravelDetailsAppbar(
                    travelModel: travelModel,
                    controller: controller,
                  ),
                  SizedBox(height: 2.h),
                  const TravelDetailsCustomRow(),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: BlocBuilder<TravelDetailsCubit, AppState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return Center(
                            child:
                                Lottie.asset(AppImages().loading, height: 80),
                          );
                        } else if (state is Success) {
                          return TravelDetailsBusSeats(
                            controller: controller,
                            travelModel: travelModel,
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "Please Select A Coach !",
                              style: TextStyle(
                                  fontSize: 20, color: AppColor.primaryColor),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  TravelDetailsConfirmButton(controller: controller),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
