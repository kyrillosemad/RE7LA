import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

forgetPasswordVerifyCodeReq(email, verifyCode) async {
  var response = Request().request(AppLink.forgetPasswordVerifyCode, {
    "email": email.toString(),
    "verifycode": verifyCode.toString(),
  });
  return response;
}
