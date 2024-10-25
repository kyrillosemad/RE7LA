import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

viewAllTravelsReq() {
  var response = Request().request(AppLink.viewAllTravelsApi, {});
  return response;
}
