import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

cancelBookingReq(seatId) {
  var response =
      Request().request(AppLink.cancelBookingApi, {"seat_id": seatId});
  return response;
}
