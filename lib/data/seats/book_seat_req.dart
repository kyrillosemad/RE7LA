import 'package:get/get.dart';
import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

import '../../core/services/services.dart';

bookSeatReq(seatsIds) {
  
  Services services = Get.find<Services>();
  var response = Request().request(AppLink.bookSeatApi, {
    "seat_ids": seatsIds,
    "owner_id": services.sharedPref!.getString("userId"),
  });
  return response;
}
