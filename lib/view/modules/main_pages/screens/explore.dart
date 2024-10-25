import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re7la/core/classes/handling_data_view.dart';
import 'package:re7la/view%20model/app_states.dart';
import 'package:re7la/view%20model/main_pages/explore_cubit.dart';
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
        child: BlocProvider(
            create: (context) => ExploreCubit(),
            child: Builder(
              builder: (context) {
                var controller = context.read<ExploreCubit>();
                controller.viewAllTravels();
                return Scaffold(
                    body: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Column(
                    children: [
                      ExplorePageAppbar(controller: controller),
                      BlocBuilder<ExploreCubit, AppState>(
                        builder: (context, state) {
                          return Expanded(
                            child: Center(
                              child: HandlingDataView(
                                state: state,
                                widget:
                                    ExploreTravelCard(controller: controller),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ));
              },
            )));
  }
}
