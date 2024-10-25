import 'package:get/get.dart';
import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';
import 'package:re7la/core/services/services.dart';

viewBookedTravelReq() {
  Services services = Get.find<Services>();
  var response = Request().request(AppLink.viewBookedTravelsApi, {
    "owner_id": services.sharedPref!.getString("userId"),
  });
  return response;
}
