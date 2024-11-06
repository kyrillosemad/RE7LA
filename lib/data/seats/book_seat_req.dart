import 'package:get/get.dart';
import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

import '../../core/services/services.dart';

bookSeatReq(seatsIds, ticketTravelId, ticketTravelFrom, ticketTravelTo,ticketTravelDate) {
  Services services = Get.find<Services>();
  var response = Request().request(AppLink.bookSeatApi, {
    "seat_ids": seatsIds,
    "owner_id": services.sharedPref!.getString("userId"),
    'ticket_travel_id': ticketTravelId,
    'ticket_travel_from': ticketTravelFrom,
    'ticket_travel_to': ticketTravelTo,
    'ticket_travel_date':ticketTravelDate,
  });
  return response;
}
