import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

signUpReq(userName, email, password, phone) {
  var response = Request().request(AppLink.signUpApi, {
    "username": userName.toString(),
    "password": password.toString(),
    "email": email.toString(),
    "phone": phone.toString(),
  });
  return response;
}
