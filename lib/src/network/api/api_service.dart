import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterapp/src/network/api/api_end_point.dart';
import 'package:flutterapp/src/util/shared_pref_util.dart';

class APIService {
  static Future<Response> request(
    String url,
    DioMethods method, {
    Map<String, dynamic> param,
  }) async {
    final token = await SharedPrefUtil.getString(PrefKey.TOKEN);
    final dio = Dio(BaseOptions(headers: _generateHeaders(token)));
    Future<Response> response;
    switch (method) {
      case DioMethods.POST:
        response = dio.post(url, data: param);
        break;
      case DioMethods.GET:
        response = dio.get(url, queryParameters: param);
        break;
      case DioMethods.PUT:
        response = dio.put(url, data: param);
        break;
      case DioMethods.DELETE:
        response = dio.delete(url, data: param);
        break;
    }
    return response
        .whenComplete(() => response)
        .catchError((error) => throw error);
  }

  static Map<String, dynamic> _generateHeaders(String token) => {
        HttpHeaders.contentTypeHeader: 'application/json',
        if (token != null) HttpHeaders.authorizationHeader: 'Bearer $token'
      };
}
