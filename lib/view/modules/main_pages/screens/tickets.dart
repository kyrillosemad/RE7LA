import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/classes/handling_data_view.dart';
import 'package:re7la/core/functions/app_exit_alert.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/tickets_cubit.dart';
import 'package:re7la/view/modules/main_pages/widgets/ticket_travel_card.dart';
import 'package:re7la/view/modules/main_pages/widgets/tickets_appbar.dart';
import 'package:sizer/sizer.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: appExitAlert,
        child: BlocProvider(
            create: (context) => TicketsCubit(),
            child: Builder(
              builder: (context) {
                var controller = context.read<TicketsCubit>();
                controller.viewBookedTravels();
                return SafeArea(
                  child: SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        const TicketsAppbar(),
                        Expanded(
                          child: BlocBuilder<TicketsCubit, AppState>(
                            builder: (context, state) {
                              return HandlingDataView(
                                state: state,
                                widget:
                                    TicketTravelCard(controller: controller),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
