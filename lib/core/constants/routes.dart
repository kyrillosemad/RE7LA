import 'package:flutter/material.dart';
import 'package:re7la/core/constants/routes_name.dart';
import 'package:re7la/view/modules/auth/screens/forget_password_email_verification.dart';
import 'package:re7la/view/modules/auth/screens/forget_password.dart';
import 'package:re7la/view/modules/auth/screens/login.dart';
import 'package:re7la/view/modules/auth/screens/reset_password.dart';
import 'package:re7la/view/modules/auth/screens/signup.dart';
import 'package:re7la/view/modules/auth/screens/signup_email_verification.dart';
import 'package:re7la/view/modules/intro_screen/screens/intro_screen.dart';
import 'package:re7la/view/modules/main_pages/screens/account.dart';
import 'package:re7la/view/modules/main_pages/screens/booked.dart';
import 'package:re7la/view/modules/main_pages/screens/booking_details.dart';
import 'package:re7la/view/modules/main_pages/screens/success_reservation.dart';
import 'package:re7la/view/modules/main_pages/screens/travel_details.dart';
import 'package:re7la/view/modules/main_pages/screens/explore.dart';
import 'package:re7la/view/modules/main_pages/screens/home_Page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().introScreen: (context) => const IntroScreen(),
  ////////////////////////////////////////////////////////////////////////
  AppRoutes().login: (context) => const Login(),
  AppRoutes().signUp: (context) => const SignUp(),
  AppRoutes().signUpEmailVerification: (context) =>
      const SignUpEmailVerification(),
  AppRoutes().forgetPassword: (context) => const ForgetPassword(),
  AppRoutes().forgetPasswordEmailVerification: (context) =>
      const ForgetPasswordEmailVerification(),
  AppRoutes().resetPassword: (context) => const ResetPassword(),
  //////////////////////////////////////////////////////////////////////////
  AppRoutes().homePage: (context) => const HomePage(),
  AppRoutes().account: (context) => const AccountPage(),
  AppRoutes().booked: (context) => const Booked(),
  AppRoutes().explore: (context) => const Explore(),
  AppRoutes().busBooking: (context) => const TravelDetails(),
  AppRoutes().bookingDetails: (context) => const BookingDetailsPage(),
  AppRoutes().successReservation: (context) => const SuccessReservation(),
};
