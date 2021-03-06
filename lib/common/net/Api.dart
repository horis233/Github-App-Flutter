import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:Github_app_flutter/common/config/Config.dart';
import 'package:Github_app_flutter/common/local/LocalStorage.dart';
import 'package:Github_app_flutter/common/net/Code.dart';
import 'package:Github_app_flutter/common/net/ResultData.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  static netFetch(
      url, params, Map<String, String> header, Options option) async {
    /*var isConnected = await NetInfo.isConnected.fetch().done;
      if (!isConnected) {
      return {
      result: false,
      code: Code.NETWORK_ERROR,
      msg: I18n('netError')
      }
      }*/
    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(headers);
    }
    //auth code
    if (optionParams["authorizationCode"] == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        optionParams["authorizationCode"] = authorizationCode;
      }
    }
    headers["Authorization"] = optionParams["authorizationCode"];
    if (option != null) {
      option.headers = headers;
    } else{
      option = new Options(method: "get");
      option.headers = headers;
    }
    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Config.DEBUG) {
        print('Request exception: ' + e.toString());
      }
      return new ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message),
          false,
          errorResponse.statusCode);
    }
    if (Config.DEBUG) {
      print('req url: ' + url);
      if (params != null) {
        print('req params: ' + params.toString());
      }
      if (response != null) {
        print('res params: ' + response.toString());
      }
    }
    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      } else {
        var responseJson = response.data;
        if (response.statusCode == 201 && responseJson["token"] != null) {
          optionParams["authorizationCode"] = 'token ' + responseJson["token"];
          await LocalStorage.save(
              Config.TOKEN_KEY, optionParams["authorizationCode"]);
        }
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS,
            headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }
    return new ResultData(Code.errorHandleFunction(response.statusCode, ""), false,
        response.statusCode);
  }

  ///clear auth
  static clearAuthorization() {
    optionParams["authorizationCode"] = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  ///get auth token
  static getAuthorization() async {
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if (basic == null) {
        //TODO
        //input username && password
      } else {
        //TODO
        // get token，get settings，return token
        return "Basic $basic";
      }
    } else {
      optionParams["authorizationCode"] = token;
      return token;
    }
  }
}
