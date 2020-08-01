class APIEndPoint {
  factory APIEndPoint(String apiBaseUrl) {
    _instance._apiBaseUrl = apiBaseUrl;
    return _instance;
  }

  APIEndPoint._internal();

  static final APIEndPoint _instance = APIEndPoint._internal();

  static APIEndPoint get instance => _instance;

  String _apiBaseUrl;

  String get todos => '$_apiBaseUrl/todos';
}

enum DioMethods { POST, GET, PUT, DELETE }
