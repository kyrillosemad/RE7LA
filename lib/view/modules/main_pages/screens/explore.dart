import 'package:flutter/material.dart';
import 'package:re7la/view/modules/main_pages/widgets/explore_appbar.dart';
import 'package:re7la/view/modules/main_pages/widgets/explore_travel_card.dart';
import 'package:sizer/sizer.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: const Column(
          children: [
            ExplorePageAppbar(),
            ExploreTravelCard(),
          ],
        ),
      )),
    );
  }
}
