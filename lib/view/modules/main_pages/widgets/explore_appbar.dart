import 'package:flutter/material.dart';
import 'package:re7la/core/constants/colors.dart';
import 'package:sizer/sizer.dart';

class ExplorePageAppbar extends StatefulWidget {
  const ExplorePageAppbar({super.key});

  @override
  State<ExplorePageAppbar> createState() => _ExplorePageAppbarState();
}

class _ExplorePageAppbarState extends State<ExplorePageAppbar> {
  @override
  Widget build(BuildContext context) {
    String? selectedFrom;
    String? selectedTo;

    final List<String> governorates = [
      'Cairo',
      'Alexandria',
      'Giza',
      'Aswan',
      'Asyut',
      'Beheira',
      'Beni Suef',
      'Dakahlia',
      'Damietta',
      'Faiyum',
      'Gharbia',
      'Ismailia',
      'Kafr El Sheikh',
      'Luxor',
      'Marsa Matruh',
      'Minya',
      'Monufia',
      'New Valley',
      'North Sinai',
      'Port Said',
      'Qalyubia',
      'Qena',
      'Red Sea',
      'Sharqia',
      'Sohag',
      'South Sinai',
      'Suez'
    ];

    return Expanded(
        flex: 1,
        child: Container(
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
                width: 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    DropdownButton<String>(
                      value: selectedFrom,
                      onChanged: (value) {
                        setState(() {
                          selectedFrom = value;
                        });
                      },
                      hint: const Text(
                        "Select",
                        style: TextStyle(color: Colors.white),
                      ),
                      dropdownColor: const Color.fromARGB(255, 106, 106, 106),
                      items: governorates.map((String governorate) {
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
                width: 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    DropdownButton<String>(
                      value: selectedTo,
                      onChanged: (value) {
                        setState(() {
                          selectedTo = value;
                        });
                      },
                      dropdownColor: const Color.fromARGB(255, 106, 106, 106),
                      hint: const Text(
                        "Select",
                        style: TextStyle(color: Colors.white),
                      ),
                      items: governorates.map((String governorate) {
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
        ));
  }
}
