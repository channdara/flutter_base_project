class APIEndPoint {
  factory APIEndPoint(String apiBaseUrl) {
    instance._apiBaseUrl = apiBaseUrl;
    return instance;
  }

  APIEndPoint._internal();

  static final APIEndPoint instance = APIEndPoint._internal();

  String _apiBaseUrl;

  String get todos => '$_apiBaseUrl/todos';
}

enum DioMethods { POST, GET, PUT, DELETE }
