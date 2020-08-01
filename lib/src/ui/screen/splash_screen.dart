import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/config/app_route.dart';
import 'package:flutterapp/src/bloc/splash/splash_bloc.dart';
import 'package:flutterapp/src/bloc/splash/splash_event.dart';
import 'package:flutterapp/src/bloc/splash/splash_state.dart';
import 'package:flutterapp/src/constant/locale_key.dart';
import 'package:flutterapp/src/model/todo.dart';
import 'package:flutterapp/src/util/alert_util.dart';
import 'package:flutterapp/src/util/string_util.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc _bloc;
  List<dynamic> _todos = [];

  @override
  void initState() {
    _bloc = SplashBloc();
    _checkBlocState();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _checkBlocState() {
    _bloc.listen((state) {
      if (state is SplashStateInit) {
        _bloc.add(SplashEventFetchTodo());
      }
      if (state is SplashStateLoading) {
        AlertUtil.showProgressDialog(context);
      }
      if (state is SplashStateLoaded) {
        AlertUtil.hideProgressDialog(context);
      }
      if (state is SplashStateError) {
        print('::: ${state.error}');
      }
      if (state is SplashStateFetchTodoSuccess) {
        _todos = state.dynamicList;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtil.getText(context, LocaleKey.app_name)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoute.SETTINGS_SCREEN);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) => _todos.isEmpty
            ? Container()
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 8.0),
                itemCount: _todos.length,
                itemBuilder: (context, index) => _buildListItem(_todos[index]),
              ),
      ),
    );
  }

  Widget _buildListItem(dynamic item) {
    return item is Todo
        ? Container(
            margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: item.isCompleted ? Colors.green : Colors.red,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${item.id}. ${item.title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(left: 16.0, bottom: 2.0, top: 16.0),
            child: Text(
              '✪ ${StringUtil.getText(context, LocaleKey.user_id)}: $item',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          );
  }
}
