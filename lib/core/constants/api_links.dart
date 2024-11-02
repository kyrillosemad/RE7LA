class AppLink {
  static const String server = "http://192.168.196.1/re7la";
///////////////////////////////////////////////////////////////////////////////
  static const String signUpApi = "$server/auth/signup.php";
  static const String loginApi = "$server/auth/login.php";
  static const String verifyCodeApi = "$server/auth/verifycode.php";
  ///////////////////////////////////////////////////////////////////////////////
  static const String addTravelApi = "$server/travels/add_travel.php";
  static const String deleteTravelApi = "$server/travels/delete_travel.php";
  static const String viewAllTravelsApi =
      "$server/travels/view_all_travels.php";
  static const String viewBookedTravelsApi =
      "$server/travels/view_booked_travels.php";
  ////////////////////////////////////////////////////////////////////////////////
  static const String bookSeatApi = "$server/seats/book_seat.php";
  static const String cancelBookingApi = "$server/seats/cancel_booking.php";
}
