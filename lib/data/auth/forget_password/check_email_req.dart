import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

chechEmailReq(email) {
  var response = Request().request(AppLink.forgetPasswordCheckEmail, {
    "email": email.toString(),
  });

  return response;
}
