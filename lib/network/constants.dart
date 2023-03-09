// http://182.18.142.132:8080/pysn/auth/register
// http://182.18.142.132:8080/pysn/auth/login
// http://182.18.142.132:8080/pysn/auth/forgotPass?userName=8791816225
// http://182.18.142.132:8080/pysn/auth/resetPass?name=8791816225&newPassword=145678&oldPassword=448134

class AppBaseUrl {

  static const String scheme = "http";

  static const String host = "182.18.142.132";

  static const int port = 8080;

  // PATH
  static const String register = "/pysn/auth/register";

  static const String login = "/pysn/auth/login";

  static const String forgotPass = "/pysn/auth/forgotPass";

  static const String resetPass = "/pysn/auth/resetPass";
  
}
