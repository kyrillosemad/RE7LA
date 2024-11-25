import 'package:re7la/core/classes/request.dart';
import 'package:re7la/core/constants/api_links.dart';

resetPasswordReq(email,password) async {
  var response = Request().request(AppLink.forgetPasswordResetPassword, {
    "email":email.toString(),
    "password":password.toString(),
  });
  return response;
}
