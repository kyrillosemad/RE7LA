  import 'package:flutter/material.dart';
  import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
  import 'package:re7la/core/constants/colors.dart';
  import 'package:re7la/view/modules/main_pages/screens/booked.dart';
  import 'package:re7la/view/modules/main_pages/screens/explore.dart';
  import 'package:re7la/view/modules/main_pages/screens/account.dart';
  import 'package:sizer/sizer.dart';

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    final PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const Explore(),
        const Booked(),
        const AccountPage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
            activeColorPrimary:  AppColor.primaryColor,
            icon: const Icon(
              Icons.explore,
            ),
            title: "Explore",
            textStyle: TextStyle(fontSize: 15.sp)),
        PersistentBottomNavBarItem(
            activeColorPrimary:  AppColor.primaryColor,
            icon: const Icon(Icons.bookmark_added),
            title: "Booked",
            textStyle: TextStyle(fontSize: 15.sp)),
        PersistentBottomNavBarItem(
            activeColorPrimary:  AppColor.primaryColor,
            icon: const Icon(Icons.person),
            title: "Account",
            textStyle: TextStyle(fontSize: 15.sp)),
      ];
    }

    @override
    Widget build(BuildContext context) {
      return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          border: Border.all(
            color:  AppColor.primaryColor,
            width: 1,
          ),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
      );
    }
  }
