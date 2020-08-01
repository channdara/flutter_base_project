import 'package:flutterapp/src/model/response/todo_response.dart';
import 'package:flutterapp/src/network/datasource/splash_datasource.dart';

abstract class SplashRepository {
  Future<TodoResponse> fetchTodos();
}

class SplashRepositoryImpl extends SplashRepository {
  SplashRepositoryImpl() {
    _dataSource = SplashDataSource();
  }

  SplashDataSource _dataSource;

  @override
  Future<TodoResponse> fetchTodos() async {
    final response = await _dataSource.fetchTodos();
    return TodoResponse.fromMap(response.data);
  }
}
