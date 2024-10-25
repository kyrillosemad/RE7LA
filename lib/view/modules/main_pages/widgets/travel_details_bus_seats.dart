import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view%20model/main_pages/travel_details_cubit.dart';
import 'package:sizer/sizer.dart';

class TravelDetailsBusSeats extends StatefulWidget {
  final TravelDetailsCubit controller;
  const TravelDetailsBusSeats({super.key, required this.controller});

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
          itemCount: widget.controller.seatSelected.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: widget.controller.seatBooked[index]
                  ? null
                  : () {
                      setState(() {
                        widget.controller.seatSelected[index] =
                            !widget.controller.seatSelected[index];
                      });
                    },
              child: Container(
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
                              color: widget.controller.seatBooked[index]
                                  ? Colors.red
                                  : widget.controller.seatSelected[index]
                                      ? AppColor.primaryColor
                                      : Colors.grey,
                              fontSize: 10.sp),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Icon(
                        Icons.event_seat,
                        size: 40,
                        color: widget.controller.seatBooked[index]
                            ? Colors.red
                            : widget.controller.seatSelected[index]
                                ? AppColor.primaryColor
                                : Colors.grey,
                      )
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
