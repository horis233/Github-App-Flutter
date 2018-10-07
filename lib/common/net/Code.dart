import 'package:fluttertoast/fluttertoast.dart';
import 'package:gsy_github_app_flutter/common/style/Style.dart';

///Error code
class Code {
  //Network Error
  static const NETWORK_ERROR = 1;
  //Network Timeout
  static const NETWORK_TIMEOUT = 2;
  //Network return data formatted once
  static const NETWORK_JSON_EXCEPTION = 3;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message) {
    switch (code) {
      case 401:
      //TODO Authorization Logic
      /*if (Actions.currentScene !== 'LoginPage') {
          Actions.reset("LoginPage");
        }*/
        Fluttertoast.showToast(msg: GithubStrings.network_error_401);
        return GithubStrings.network_error_401; //401 Unauthorized
      case 403:
        Fluttertoast.showToast(msg: GithubStrings.network_error_403);
        return GithubStrings.network_error_403;
      case 404:
        Fluttertoast.showToast(msg: GithubStrings.network_error_404);
        return GithubStrings.network_error_404;
      case NETWORK_TIMEOUT:
      //超时
        Fluttertoast.showToast(msg: GithubStrings.network_error_timeout);
        return GithubStrings.network_error_timeout;
      default:
        Fluttertoast.showToast(msg: GithubStrings.network_error_unknown + " " + message);
        return GithubStrings.network_error_unknown;
    }
  }
}
