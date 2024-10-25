import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:re7la/view%20model/main_pages/explore_cubit.dart';
import 'package:sizer/sizer.dart';

class ExplorePageAppbar extends StatefulWidget {
  final ExploreCubit controller;
  const ExplorePageAppbar({super.key, required this.controller});

  @override
  State<ExplorePageAppbar> createState() => _ExplorePageAppbarState();
}

class _ExplorePageAppbarState extends State<ExplorePageAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColor.primaryColor, AppColor.primaryColor]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.sp),
              bottomRight: Radius.circular(25.sp))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "From",
                  style: TextStyle(color: Colors.white, fontSize: 17.sp),
                ),
                DropdownButton<String>(
                  value: widget.controller.selectedFrom,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.selectedFrom = value;
                      widget.controller.viewAllTravels();
                    });
                  },
                  hint: const Text(
                    "Select",
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: const Color.fromARGB(255, 106, 106, 106),
                  items:
                      widget.controller.governorates.map((String governorate) {
                    return DropdownMenuItem<String>(
                      value: governorate,
                      child: Text(
                        governorate,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const VerticalDivider(color: Colors.white, thickness: 5),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To",
                  style: TextStyle(color: Colors.white, fontSize: 17.sp),
                ),
                DropdownButton<String>(
                  value: widget.controller.selectedTo,
                  onChanged: (value) {
                    setState(() {
                      widget.controller.selectedTo = value;
                      widget.controller.viewAllTravels();
                    });
                  },
                  dropdownColor: const Color.fromARGB(255, 106, 106, 106),
                  hint: const Text(
                    "Select",
                    style: TextStyle(color: Colors.white),
                  ),
                  items:
                      widget.controller.governorates.map((String governorate) {
                    return DropdownMenuItem<String>(
                      value: governorate,
                      child: Text(
                        governorate,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
