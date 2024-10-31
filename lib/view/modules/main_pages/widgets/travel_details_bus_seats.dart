import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/core/services/services.dart';
import 'package:re7la/model/travel_model.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/travel_details_cubit.dart';
import 'package:sizer/sizer.dart';

class TravelDetailsBusSeats extends StatefulWidget {
  final TravelDetailsCubit controller;
  final TravelModel travelModel;

  const TravelDetailsBusSeats({
    Key? key,
    required this.controller,
    required this.travelModel,
  }) : super(key: key);

  @override
  State<TravelDetailsBusSeats> createState() => _TravelDetailsBusSeatsState();
}

class _TravelDetailsBusSeatsState extends State<TravelDetailsBusSeats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5.sp,
            mainAxisSpacing: 5.sp,
          ),
          itemCount: widget.travelModel.coaches![widget.controller.coachNumber]
              .seats!.length,
          itemBuilder: (context, index) {
            var seats = widget.travelModel
                .coaches![widget.controller.coachNumber].seats![index];
            Services services = Get.find<Services>();
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.selectSeat(widget, index);
                });
              },
              child: BlocBuilder<TravelDetailsCubit, AppState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 224, 224)
                          .withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Seat ${index + 1}",
                            style: TextStyle(
                              color: widget.controller.selectedSeat
                                      .contains(seats.seatId.toString())
                                  ? AppColor.primaryColor
                                  : seats.seatStatus == 0
                                      ? AppColor.grey
                                      : seats.ownerId.toString() ==
                                              services.sharedPref!
                                                  .getString("userId")
                                          ? Colors.green
                                          : Colors.red,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Icon(
                          Icons.event_seat,
                          size: 40,
                          color: widget.controller.selectedSeat
                                  .contains(seats.seatId.toString())
                              ? AppColor.primaryColor
                              : seats.seatStatus == 0
                                  ? AppColor.grey
                                  : seats.ownerId.toString() ==
                                          services.sharedPref!
                                              .getString("userId")
                                      ? Colors.green
                                      : Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
