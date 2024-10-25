import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                return SafeArea(
                  child: Column(
                    children: [
                      const TravelDetailsAppbar(),
                      SizedBox(height: 2.h),
                      const TravelDetailsCustomRow(),
                      SizedBox(height: 2.h),
                      TravelDetailsBusSeats(
                        controller: controller,
                      ),
                      const TravelDetailsConfirmButton(),
                    ],
                  ),
                );
              },
            )));
  }
}
