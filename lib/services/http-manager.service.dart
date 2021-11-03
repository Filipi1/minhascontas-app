import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minhascontas/config/http.config.dart';

class HTTPManager {
  static Future getHeaders() async {
    var userBox = GetStorage();

    Map<String, dynamic> headers = {};
    if (userBox.val("token").toString() != "") {
      headers = {
        Headers.wwwAuthenticateHeader:
        "Bearer ${userBox.read("token").toString()}",
        Headers.contentTypeHeader: "application/json"
      };
    } else {
      headers = {
        Headers.contentTypeHeader: "application/json"
      };
    }

    return headers;
  }

  static Future<Response> postMethod(String path, Map<dynamic, dynamic> body, {queryParams}) async {
    Response response = await Dio().post(
      '${HttpConfig.apiUrl}$path',
      data: body,
      queryParameters: queryParams,
      options: Options(headers: await getHeaders()),
    );
    return response;
  }

  static Future<Response> getMethod(String path, {queryParams}) async {
    Response response = await Dio().get(
      '${HttpConfig.apiUrl}$path',
      queryParameters: queryParams,
      options: Options(headers: await getHeaders()),
    );
    return response;
  }

  static void errorHandler(BuildContext context, Response response) {
    switch(response.statusCode) {

    }
  }
}
