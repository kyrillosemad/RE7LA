import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class BusBookingBusSeats extends StatefulWidget {
  const BusBookingBusSeats({super.key});

  @override
  State<BusBookingBusSeats> createState() => _BusBookingBusSeatsState();
}

class _BusBookingBusSeatsState extends State<BusBookingBusSeats> {
  @override
  Widget build(BuildContext context) {
    List<bool> seatSelected = List.generate(49, (index) => false);
    List<bool> seatBooked = List.generate(49, (index) => index % 3 == 0);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5.sp,
            mainAxisSpacing: 5.sp,
          ),
          itemCount: seatSelected.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: seatBooked[index]
                  ? null
                  : () {
                      setState(() {
                        seatSelected[index] = !seatSelected[index];
                        print(seatSelected);
                      });
                    },
              child: Container(
                decoration: BoxDecoration(
                  color: seatBooked[index]
                      ? Colors.red
                      : seatSelected[index]
                          ? AppColor.primaryColor
                          : Colors.grey,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Center(
                  child: Text(
                    "Seat ${index + 1}",
                    style: TextStyle(color: Colors.white, fontSize: 8.sp),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
