import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

loginReq(email, password) {
  var response = Request().request(AppLink.loginApi, {
    "email": email.toString(),
    "password": password.toString(),
  });
  return response;
}
