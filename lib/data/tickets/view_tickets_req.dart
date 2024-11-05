import 'package:get/get.dart';
import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';
import 'package:re7la/core/services/services.dart';

viewTicketsReq() {
  Services services = Get.find<Services>();
  var response = Request().request(AppLink.viewTickets, {
    "owner_id": services.sharedPref!.getString("userId"),
  });
  return response;
}
