import 'package:get/get.dart';
import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

import '../../core/services/services.dart';

viewAllTravelsReq() {
  Services services = Get.find<Services>();
  var response = Request().request(AppLink.viewAllTravelsApi, {
    "owner_id": services.sharedPref!.getString("userId"),
  });
  return response;
}
