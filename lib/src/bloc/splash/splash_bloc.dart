import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/src/bloc/splash/splash_event.dart';
import 'package:flutterapp/src/bloc/splash/splash_state.dart';
import 'package:flutterapp/src/model/todo.dart';
import 'package:flutterapp/src/network/repository/splash_repository.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() {
    _repository = SplashRepositoryImpl();
  }

  SplashRepository _repository;

  @override
  SplashState get initialState => SplashStateInit();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashEventFetchTodo) {
      try {
        yield SplashStateLoading();
        final response = await _repository.fetchTodos();
        final dynamicList = _groupListItem(response.todos);
        yield SplashStateLoaded();
        yield SplashStateFetchTodoSuccess(dynamicList);
      } catch (error) {
        yield SplashStateLoaded();
        yield SplashStateError(error.toString());
      }
    }
  }

  List<dynamic> _groupListItem(List<Todo> todos) {
    final List<dynamic> newList = [];
    for (int i = 0; i < todos.length; i++) {
      if (i == 0) {
        newList.add(todos[i].userID);
        newList.add(todos[i]);
        continue;
      }
      final Todo tmp = todos[i - 1];
      if (todos[i].userID == tmp.userID) {
        newList.add(todos[i]);
        continue;
      }
      newList.add(todos[i].userID);
      newList.add(todos[i]);
    }
    return newList;
  }
}
