import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/classes/handling_data_view.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/booked_cubit.dart';
import 'package:re7la/view/modules/main_pages/widgets/booked_appbar.dart';
import 'package:re7la/view/modules/main_pages/widgets/booked_travel_card.dart';
import 'package:sizer/sizer.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: BlocProvider(
          create: (context) => BookedCubit()..viewBookedTravels(),
          child: SafeArea(
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  const BookedAppbar(),
                  Expanded(
                    child: BlocBuilder<BookedCubit, AppState>(
                      builder: (context, state) {
                        var controller = context.read<BookedCubit>();
                        return HandlingDataView(
                          state: state,
                          widget: BookedTravelCard(controller: controller),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
