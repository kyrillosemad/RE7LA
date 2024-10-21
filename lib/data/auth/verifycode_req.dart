import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

verifyCodeReq(email, verifyCode) {
  var response = Request().request(AppLink.verifyCodeApi, {
    "email": email.toString(),
    "verifycode": verifyCode.toString(),
  });
  return response;
}
