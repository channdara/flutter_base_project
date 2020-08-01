import 'package:dio/dio.dart';
import 'package:flutterapp/src/network/api/api_end_point.dart';
import 'package:flutterapp/src/network/api/api_service.dart';

class SplashDataSource {
  final APIEndPoint _apiEndPoint = APIEndPoint.instance;

  Future<Response> fetchTodos() async {
    return await APIService.request(_apiEndPoint.todos, DioMethods.GET);
  }
}
